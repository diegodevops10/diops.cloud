# ------------------------------------------------------------------------------
# PROVIDER CONFIG
# ------------------------------------------------------------------------------

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.73.1"
    }
  }
  backend "s3" {}
}

# ------------------------------------------------------------------------------
# VM CONFIG
# ------------------------------------------------------------------------------

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = var.machine_name
  node_name = var.node_name

  agent {
    enabled = true
  }

  cpu {
    cores   = var.cpu_cores
    sockets = var.cpu_sockets
  }

  memory {
    dedicated = var.memory_mb
  }

  disk {
    datastore_id = var.machine_volume_name
    file_id      = var.default_ubuntu_iso
    interface    = var.disk_interface
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  initialization {
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }
}
