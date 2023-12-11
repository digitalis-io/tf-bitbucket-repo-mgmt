resource "bitbucket_deployment_variable" "default" {
  depends_on = [bitbucket_deployment.default]
  for_each = {
    for rd in local.repo_deployment_variable_mapped_list : "${rd.repo}.${rd.deployment}.${rd.variable_name}" => rd
  }
  deployment = bitbucket_deployment.default["${each.value.repo}.${each.value.deployment}"].id
  key        = each.value.variable_name
  value      = each.value.variable_value
  secured    = true
}
