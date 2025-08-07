// All providers

variable "endpoint" {
  type = string
}

// API Provider

variable "api_token" {
  type      = string
  sensitive = true
}

// Generic VM

variable "ssh_key_path" {
  type = string
}

variable "default_gateway" {
  type = string
}

variable "dns_servers" {
  type      = list(string)
  sensitive = true
}

variable "deploy_key" {
  type = string
}

variable "default_user" {
  type = string
}

// Docker External VM

variable "docker_external_ip" {
  type = string
}

// Docker Internal VM

variable "docker_internal_ip" {
  type = string
}

