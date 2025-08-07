module "vm_1010_docker_external" {
  source = "../modules/cloud-init-vm"

  # VM configuration
  name  = "docker-external"
  vm_id = 1010
  node  = local.node
  tags  = ["debian", "docker", "public"]

  # Credentials
  user     = var.default_user
  ssh_keys = data.local_file.ssh_public_key.content

  # Resources
  cpu_cores = 4
  memory    = 4096
  disk_size = 50

  # Distro image configuration
  url                = "https://cloud.debian.org/images/cloud/bookworm/20250316-2053/debian-12-generic-amd64-20250316-2053.qcow2"
  filename           = "debian-12-generic-amd64-20250316-2053.img"
  checksum           = "afcd77455c6d10a6650e8affbcb4d8eb4e81bd17f10b1d1dd32d2763e07198e168a3ec8f811770d50775a83e84ee592a889a3206adf0960fb63f3d23d1df98af"
  checksum_algorithm = "sha512"

  # Networking
  ipaddress   = var.docker_external_ip
  gateway     = var.default_gateway
  dns_servers = var.dns_servers

  # Ansible
  repo_url = "git@github.com:digidaniel-dev/homelab.platform.git"
  deploy_key = var.deploy_key
}
