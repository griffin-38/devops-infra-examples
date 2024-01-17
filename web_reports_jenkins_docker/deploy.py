#!/usr/bin/env python3

import requests
import argh
import os
import time
import sys

from urllib.parse import urljoin


class Rancher:
    def __init__(self, host, access_key, secret_key):
        self.host = host
        self.access_key = access_key
        self.secret_key = secret_key
        self.session = requests.Session()

    def request(self, method, path, params=None, json=None):
        response = self.session.request(
            method=method,
            url=urljoin(self.host, path),
            auth=(self.access_key, self.secret_key),
            params=params,
            json=json,
        )

        if response.status_code >= 300:
            print(method, urljoin(self.host, path), response.text, file=sys.stderr)

        return response


def upgrade_rancher_service(rancher_host, environment_id, service_id, image):
    """
    Upgrade a service to use the given image.
    """

    rancher_access_key = os.getenv("RANCHER_ACCESS_KEY", "").strip()
    rancher_secret_key = os.getenv("RANCHER_SECRET_KEY", "").strip()

    if not rancher_access_key or not rancher_secret_key:
        print("Credentials to Rancher were not provided.", file=sys.stderr)

        raise SystemExit(1)

    print(
        f"Upgrading service: rancher_host={rancher_host}, environment_id={environment_id}, service_id={service_id}, to image {image}"
    )

    rancher = Rancher(rancher_host, rancher_access_key, rancher_secret_key)

    # fetch current config

    launch_config = rancher.request(
        "GET", f"/v2-beta/projects/{environment_id}/services/{service_id}"
    ).json()["launchConfig"]
    launch_config["imageUuid"] = f"docker:{image}"

    # Perform upgrade

    rancher.request(
        "POST",
        f"/v2-beta/projects/{environment_id}/services/{service_id}",
        params={"action": "finishupgrade"},
    )

    time.sleep(2.0)

    rancher.request(
        "POST",
        f"/v2-beta/projects/{environment_id}/services/{service_id}",
        params={"action": "upgrade"},
        json={
            "inServiceStrategy": {
                "batchSize": 1,
                "intervalMillis": 2000,
                "launchConfig": launch_config,
            }
        },
    ).raise_for_status()

    # wait for upgrade to be complete

    start_time = time.time()

    while True:
        time.sleep(10.0)

        status = rancher.request(
            "GET", f"/v2-beta/projects/{environment_id}/services/{service_id}"
        ).json()["state"]

        if status == "active":
            break

        if status == "upgraded":
            status = rancher.request(
                "POST",
                f"/v2-beta/projects/{environment_id}/services/{service_id}",
                params={"action": "finishupgrade"},
            )

            break

        if time.time() - start_time > 300.0:
            rancher.request(
                "POST",
                f"/v2-beta/projects/{environment_id}/services/{service_id}",
                params={"action": "rollback"},
            )

            print(
                "Error during deploy: service failed to become healthy in time and was rolled back.",
                file=sys.stderr,
            )

            raise SystemExit(1)


if __name__ == "__main__":
    argh.dispatch_command(upgrade_rancher_service)
