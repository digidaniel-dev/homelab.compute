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

// Talos VM's

variable "talos-1_ip" {
  type = string
}

variable "talos-1_mac" {
  type = string
}

variable "talos-2_ip" {
  type = string
}

variable "talos-2_mac" {
  type = string
}

variable "talos-3_ip" {
  type = string
}

variable "talos-3_mac" {
  type = string
}

