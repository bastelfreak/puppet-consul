# run puppet on all nodes
# disable puppet
# assume they got the consul class with acls enabled
# check if consul is running on all nodes
# verify acls are enabled and allowed in config
# on first node:
#   run task to bootstrap acls
#   write output to file
#   get secretID
#   create policy to manage ACLs
#   create token for that
#   use it to create a policy for each node
#   create a token for those policies
#
# inject tokens to /etc/consul.d/consul.env
# restart consul
# people can change the default policy to deny
#
#
plan consul::bootstrap_acls (
  TargetSpec $targets,
) {
  if count(get_targets($targets)) < 3 {
    fail('we need at least 3 nodes in a consul cluster')
  }
  run_plan('puppet_agent::run', $targets)
  run_task('enterprise_tasks:disable_agent', $targets)
  run_task('service', $targets, {'action' => 'status', 'name' => 'consul',})
  run_task('enterprise_tasks:enable_agent', $targets)
}
