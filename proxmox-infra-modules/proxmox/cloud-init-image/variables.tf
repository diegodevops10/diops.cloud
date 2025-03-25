variable "node_name" {
  description = "The name of the Proxmox node where the cloud image will be downloaded"
  type        = string
}

variable "datastore_volume_name" {
  description = "The name of the Proxmox node where the cloud image will be downloaded"
  type        = string
  default     = "local"
}
