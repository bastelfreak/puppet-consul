#!/usr/bin/env bash

acl=$(jq '.acl' /etc/consul.d/config.json)
if [ "${acl}" == 'null' ]; then
  result='{"_error": {"msg": "ACL block missing in /etc/consul.d/config.json", "kind": "puppetlabs.tasks/task-error", "details": ""}}'
else
  result="${acl}"
fi

echo "${result}"
