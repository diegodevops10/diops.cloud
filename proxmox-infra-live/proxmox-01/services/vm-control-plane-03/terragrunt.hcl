include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/proxmox-infra-modules/proxmox/qemu-vm"
}

locals {
  machine_vars = read_terragrunt_config(find_in_parent_folders("machine.hcl")).locals
}

inputs = {
  node_name           = local.machine_vars.node_name
  machine_name        = "vm-control-plane-03"
  ssh_public_key_path = "${get_env("HOME")}/.ssh/id_rsa.pub"
  cpu_cores           = 2
  memory_mb           = 4096
  ipv4_address        = "192.168.15.156/24"
  ipv4_gateway        = "192.168.15.1"
}
