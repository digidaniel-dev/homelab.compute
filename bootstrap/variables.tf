variable "default_user" {
  type = string
}

variable "node" {
  type = string
}

variable "vault_ip" {
  type = string
}

variable "vault_mac" {
  type = string
}

variable "gitea_ip" {
  type = string
}

variable "gitea_mac" {
  type = string
}

variable "default_gateway" {
  type = string
}

variable "dns_servers" {
  type      = list(string)
  sensitive = true
}

variable "endpoint" {
  type    = string
}

variable "ssh_user" {
  type    = string
}

variable "ssh_password" {
  type    = string
}

variable "api_token" {
  type    = string
}

variable "deploy_key" {
  type = string
}
