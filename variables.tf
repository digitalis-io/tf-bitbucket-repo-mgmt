variable "repo_deployment_list_json" {
  default = ""
  type    = string 
}

variable "repo_deployment_list" {
  default = {}
}

variable "deployment_variables_list_json" {
  default = ""
  type    = string
}

variable "deployment_variables_list" {
  type    = map(any)
  default = {}
}

variable "region" {
  description = "Region"
  default     = "eu-west-2"
}

variable "env" {
  description = "Enviroment"
  default     = "mgmt"
}

variable "cloudflare_token" {
  description = "Cloudflare token to access Vault"
  default     = ""
}
