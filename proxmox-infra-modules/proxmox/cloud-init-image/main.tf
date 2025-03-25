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
# RESOURCE
# ------------------------------------------------------------------------------

# Download the ubuntu ISO and stores on Proxmox
resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_volume_name
  node_name    = var.node_name
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}
