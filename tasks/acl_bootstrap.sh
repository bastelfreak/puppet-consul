#!/usr/bin/env bash
acl="$(consul acl bootstrap -format json)"

if [ $? -eq 1 ]; then
  result='{"_error": {"msg": "ACL bootstrapping failed", "kind": "puppetlabs.tasks/task-error", "details": ""}}'
else
  result="${acl}"
fi

echo "${result}"
