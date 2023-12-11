resource "bitbucket_repository" "default" {
  for_each = {
    for ar in local.repo_deployment_list : ar.repo_name => ar
  }
  owner             = each.value.repo_owner
  name              = each.value.repo_name
  project_key       = each.value.project_key
  description       = each.value.description
  is_private        = each.value.is_private
  pipelines_enabled = each.value.pipelines_enabled
  fork_policy       = each.value.fork_policy
}
