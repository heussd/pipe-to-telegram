#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

docker events | python3 -u pipe-to-telegram.py