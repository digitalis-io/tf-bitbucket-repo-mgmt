locals {
  repo_deployment_list        = jsondecode(var.repo_deployment_list_json)["repo_deployment_list"]
  
  deployment_variables_list   = jsondecode(var.deployment_variables_list_json)["deployment_variables_list"]

  repo_deployment_mapped_list = distinct(flatten([
    for repo in local.repo_deployment_list : [
      for deployments in repo.deployments : {
        repo_name  = repo.repo_name
        deployment = deployments
      }
    ]
  ]))

  repo_deployment_variable_mapped_list = distinct(flatten([
    for deployment in local.repo_deployment_mapped_list : [
      for k, v in local.deployment_variables_list[deployment.deployment] : {
        repo           = deployment.repo_name
        deployment     = deployment.deployment
        variable_name  = upper(k)
        variable_value = v
      }
    ]
    ]
  ))
}