module "vm_1000-truenas" {
  source = "../modules/truenas"

  name = "truenas"
  vm_id = 1000
  node = "gryffindor"
  tags = [ "truenas" ]

  iso_url                = "https://download.sys.truenas.net/TrueNAS-SCALE-ElectricEel/24.10.2/TrueNAS-SCALE-24.10.2.iso"
  iso_filename           = "TrueNAS-SCALE-24.10.2.iso"
  iso_checksum           = "33e29ed62517bc5d4aed6c80b9134369e201bb143e13fefdec5dbf3820f4b946"
  iso_checksum_algorithm = "sha256"

}
