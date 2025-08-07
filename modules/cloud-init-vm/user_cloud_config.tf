resource "proxmox_virtual_environment_file" "user_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.node

  source_raw {
    data = templatefile("${path.module}/cloud_config.tmpl", {
      hostname = var.name
      username = var.user
      ssh_key = trimspace(var.ssh_keys)
      deploy_key = indent(6, trimspace(var.deploy_key))
      repo_url = var.repo_url
      // By setting the playbook to the same as the host it is easier to know
      // what playbook is run.
      playbook = "${var.name}.yml"
      write_files_block = indent(2, trimspace(local.write_files_block))
    })

    file_name = "${var.name}-user-cloud-config.yaml"
  }
}
