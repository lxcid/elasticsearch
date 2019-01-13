#!/bin/bash
set -e

elasticsearch-keystore create

if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
  echo >&2 "error: expect AWS_ACCESS_KEY_ID environment variable"
  exit 1
else
  echo "${AWS_ACCESS_KEY_ID}" | elasticsearch-keystore add --stdin s3.client.default.access_key
fi

if [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
  echo >&2 "error: expect AWS_SECRET_ACCESS_KEY environment variable"
  exit 1
else
  echo "${AWS_SECRET_ACCESS_KEY}" | elasticsearch-keystore add --stdin s3.client.default.secret_key
fi

exec /usr/local/bin/docker-entrypoint.sh "$@"
