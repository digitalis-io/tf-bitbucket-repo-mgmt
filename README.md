
# Running the terraform

## Export the bitbucket username and token
e.g. 
```
export BITBUCKET_USERNAME=<BITBUCKET_USERNAME>
export BITBUCKET_PASSWORD=<BITBUCKET_USERS_TOKEN>
```


# When you decide to use vault add the Vault the config in the secret store or the variables for the repo list and deployment variable list

Login to https://<VAULT_URL> navigate to secrets/bitbucket/tf-bitbucke-repos and update the json config for the repo management.
export the VAULT_ADDR=https://<VAULT_ADDR>

Then set the tf secrets
```
data "vault_generic_secret" "repo_deployment_list" {
  path = "secret/bitbucket/tf-bitbucket-repos/repo-deployment-list"
}

data "vault_generic_secret" "deployment_variable_list" {
  path = "secret/bitbucket/tf-bitbucket-repos/deployment-variable-list"
}
```

Update the variable to read the value and decode the secrets from Vault
```
repo_deployment_list = nonsensitive(jsondecode(data.vault_generic_secret.repo_deployment_list.data_json)["repo_deployment_list"])

deployment_variables_list = nonsensitive(jsondecode(data.vault_generic_secret.deployment_variable_list.data_json)["deployment_variables_list"])
```

# Running

1) terraform init

2) terraform plan -var-file="./params/dev.tfvars"

3) terraform apply -var-file="./params/dev.tfvars"


# Importing existing bitbucket repo's

```
terraform import -input=false -var-file="./params/dev.tfvars" 'bitbucket_repository.default["<REPO_NAME>"]' <BITBUCKETWORKSPACESLUG>/<REPO_NAME>
```

```
Example : 
terraform import bitbucket_deployment.example "workspace-slug/example-repo/1234"
```