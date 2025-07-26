// All providers

variable "endpoint" {
  type = string
}

// SSH provider

variable "password" {
  type      = string
  sensitive = true
}

variable "ssh_user" {
  type = string
}

variable "ssh_password" {
  type      = string
  sensitive = true
}

// API Provider

variable "api_token" {
  type      = string
  sensitive = true
}

// Proxmox ACME Account

variable "email" {
  type = string
}

// Proxmox ACME Plugin

variable "cloudflare_account_id" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

// Generic VM

variable "ssh_key_path" {
  type = string
}

variable "dns_servers" {
  type      = list(string)
  sensitive = true
}

// Docker VM

variable "docker_login_user" {
  type = string
}

variable "docker_ip" {
  type = string
}

variable "docker_gateway" {
  type = string
}

// Gitea VM

variable "gitea_login_user" {
  type = string
}

variable "gitea_ip" {
  type = string
}

variable "gitea_gateway" {
  type = string
}

// Github runner VM

variable "github_runner_login_user" {
  type = string
}

variable "github_runner_ip" {
  type = string
}

variable "github_runner_gateway" {
  type = string
}
