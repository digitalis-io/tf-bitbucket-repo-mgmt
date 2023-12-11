repo_deployment_list_json = <<EOF
{
  "repo_deployment_list": [
    {
        "repo_name": "The name of the repository", 
        "repo_owner": "The Owner of this repository", 
        "project_key": "If you want to have this repo associated with a Project e.g. DEVOPS", 
        "deployments": [
            "deployment_or_env_name_1",
            "deployment_or_env_name_2"
        ],  
        "description": "This will be the repository description", 
        "fork_policy": "1 of 3 options : no_forks, allow_forks or no_public_forks",
        "is_private": true, 
        "pipelines_enabled": true
    },
    {
        "repo_name": "REPO_NUMBER_2", 
        "repo_owner": "The Owner of REPO_NUMBER_2", 
        "project_key": "If you want to have this repo associated with a Project e.g. DEVOPS", 
        "deployments": [
            "deployment_or_env_name_1",
            "deployment_or_env_name_2"
        ],
        "description": "This will be the repository description", 
        "fork_policy": "1 of 3 options : no_forks, allow_forks or no_public_forks",
        "is_private": true,
        "pipelines_enabled": true
    }
  ]
}
EOF

deployment_variables_list_json = <<EOF
{
  "deployment_variables_list": {
      "deployment_or_env_name_1": {
          "stage": "Test", 
          "environment": "dev",
          "region": "eu-west-2", 
          "aws_account": "a user friendly AWS account name e.g. Dev or Staging or Prod",
          "aws_acces_key": "your_aws_secret_key",
          "aws_secret_key": "your_aws_secret_access_key"
      },
      "deployment_or_env_name_2": {
          "stage": "Test", 
          "environment": "stage or staging",
          "aws_account": "a user friendly AWS account name e.g. Dev or Staging or Prod",
          "region": "eu-west-2", 
          "aws_acces_key": "your_aws_secret_key",
          "aws_secret_key": "your_aws_secret_access_key",
          "Tag_Environment": "Test",
          "Tag_Team": "Could be a internal team name"
      }
  }
}
EOF

