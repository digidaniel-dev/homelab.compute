variable "name" {
  type        = string
  description = "Defines the name of the VM"
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Sets description for the VM"
}

variable "tags" {
  type        = list(string)
  description = "Adds tags to the VM to keep things organized"
  default     = []
}

variable "node" {
  type        = string
  description = "Defines what Proxmox node the VM should be added to"
}

variable "vm_id" {
  type        = number
  description = "Defines an ID to the VM"
}

variable "datastore_id" {
  type        = string
  default     = "local-zfs"
  description = "Defines what datastore the data should be store at"
}

variable "iso_url" {
  type = string
}

variable "iso_filename" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "iso_checksum_algorithm" {
  type = string
  default = "sha256"
}
