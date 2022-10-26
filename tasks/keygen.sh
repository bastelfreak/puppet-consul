#!/usr/bin/env bash
password="$(consul keygen)"

if [ -z "${password}" ]; then
  result='{"_error": {"msg": "no key generated", "kind": "puppetlabs.tasks/task-error", "details": ""}}'
else
  result="{\"password\": \"${password}\"}"
fi

echo "${result}"
