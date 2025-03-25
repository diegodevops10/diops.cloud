
data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key_path
}

data "proxmox_virtual_environment_datastores" "first_node" {
  node_name = var.node_name
}
