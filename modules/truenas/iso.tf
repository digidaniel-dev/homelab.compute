module "latest_truenas_iso" {
  source = "../download-iso"

  node               = var.node
  url                = var.iso_url
  filename           = var.iso_filename
  checksum           = var.iso_checksum
  checksum_algorithm = var.iso_checksum_algorithm
}
