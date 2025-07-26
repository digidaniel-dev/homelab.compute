module "vm_1030_gitea" {
  source = "../modules/cloud-init-vm"
  providers = {
    proxmox = proxmox.api
  }

  # VM configuration
  name  = "gitea"
  vm_id = 1030
  node  = module.main-node.name
  tags  = ["debian", "gitea"]

  # Credentials
  user     = var.gitea_login_user
  ssh_keys = data.local_file.ssh_public_key.content

  # Resources
  cpu_cores = 4
  memory    = 4096
  disk_size = 50

  # Distro image configuration
  url                = "https://cloud.debian.org/images/cloud/bookworm/20250703-2162/debian-12-generic-amd64-20250703-2162.qcow2"
  filename           = "debian-12-generic-amd64-20250703-2162.img"
  checksum           = "c651c2f3fd1ee342f225724959a86a97ad804027c3f057e03189455d093d07a006390929a22df0f95a5269291badc619964bde8bf9e2a33b6f3a01f492895068"
  checksum_algorithm = "sha512"

  # Networking
  ipaddress   = var.gitea_ip
  gateway     = var.gitea_gateway
  dns_servers = var.dns_servers
}
