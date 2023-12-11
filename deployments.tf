resource "bitbucket_deployment" "default" {
  depends_on = [bitbucket_repository.default]
  for_each = {
    for repo in local.repo_deployment_mapped_list : "${repo.repo_name}.${repo.deployment}" => repo
  }
  repository = bitbucket_repository.default[each.value.repo_name].id
  name       = each.value.deployment
  stage      = local.deployment_variables_list["${each.value.deployment}"].stage
}
