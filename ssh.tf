# resource "bitbucket_pipeline_ssh_key" "default" {
#   for_each = {
#     for ar in local.repo_deployment_list : ar.repo_name => ar
#   }
#   workspace   = each.value.repo_owner
#   repository  = each.value.repo_name
#   public_key  = base64decode(data.vault_generic_secret.ssh.data["public_key"])
#   private_key = base64decode(data.vault_generic_secret.ssh.data["private_key"])
# }