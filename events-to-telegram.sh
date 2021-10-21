#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

docker events --filter "event=die" --filter 'event=start' \
  | python3 -u pipe-to-telegram.py
