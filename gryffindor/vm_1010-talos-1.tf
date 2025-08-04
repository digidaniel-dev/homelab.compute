module "vm_1010-talos-1" {
  source = "../modules/cloud-init-vm"
  providers = {
    proxmox = proxmox.api
  }

  # VM configuration
  name  = "talos-1"
  vm_id = 1010
  node  = module.main-node.name
  tags  = ["talos", "k8s"]

  # Credentials
  user     = var.default_user
  ssh_keys = data.local_file.ssh_public_key.content

  # Resources
  cpu_type  = "host"
  cpu_cores = 4
  memory    = 4096
  disk_size = 50

  # Distro image configuration
  url                = "https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/v1.10.6/nocloud-amd64-secureboot.iso"
  filename           = "talos-nocloud-amd64-secureboot.img"
  checksum           = "e175e94bf103423e6e4d467e2fab30200d786eae8f6b51336068d476b111ece3399fead6934548734b578ccee508bcc4dd75a9f6fd4393e65a625e3b9093cc00"
  checksum_algorithm = "sha512"

  # Networking
  ipaddress   = var.talos-1_ip
  macaddress  = var.talos-1_mac
  gateway     = var.default_gateway
  dns_servers = var.dns_servers

  use_ansible_pull = false
}
