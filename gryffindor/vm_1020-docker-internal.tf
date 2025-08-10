module "vm_1020_docker_internal" {
  source = "../modules/cloud-init-vm"

  # VM configuration
  vm_id   = 1021
  vm_name = "docker-internal"
  vm_node = local.node
  vm_tags = ["debian", "docker", "private"]

  # Credentials
  vm_user = var.default_user

  # Resources
  vm_cpu_cores = 4
  vm_memory    = 4096
  vm_disk_size = 50

  # Distro image configuration
  download_file_url                = "https://cloud.debian.org/images/cloud/bookworm/20250316-2053/debian-12-generic-amd64-20250316-2053.qcow2"
  download_file_filename           = "debian-12-generic-amd64-20250316-2053.img"
  download_file_checksum           = "afcd77455c6d10a6650e8affbcb4d8eb4e81bd17f10b1d1dd32d2763e07198e168a3ec8f811770d50775a83e84ee592a889a3206adf0960fb63f3d23d1df98af"
  download_file_checksum_algorithm = "sha512"

  # Networking
  vm_ipaddress   = var.docker_internal_ip
  vm_macaddress  = var.docker_internal_mac
  vm_gateway     = var.default_gateway
  vm_dns_servers = var.dns_servers

  # Ansible
  ansible_repo_url    = "git@github.com:digidaniel-dev/homelab.platform.git"
  ansible_deploy_key  = var.deploy_key
}
