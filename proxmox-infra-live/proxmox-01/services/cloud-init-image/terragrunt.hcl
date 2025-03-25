include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/proxmox-infra-modules/proxmox/cloud-init-image"
}

locals {
  machine_vars = read_terragrunt_config(find_in_parent_folders("machine.hcl")).locals
}

inputs = {
  node_name = local.machine_vars.node_name
}
