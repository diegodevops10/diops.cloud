variable "node_name" {
  description = "The name of the Proxmox node where the cloud image will be downloaded"
  type        = string
}

variable "machine_name" {
  description = "The name of virtual machine"
  type        = string
}

variable "datastore_volume_name" {
  description = "The name of the Proxmox node where the cloud image will be downloaded"
  type        = string
  default     = "local"
}

variable "machine_volume_name" {
  description = "The name of the Proxmox node where the cloud image will be downloaded"
  type        = string
  default     = "local-lvm"
}

variable "default_ubuntu_iso" {
  description = "Name of ISO image downloaded on Proxmox"
  type        = string
  default     = "local:iso/jammy-server-cloudimg-amd64.img"
}

variable "ssh_public_key_path" {
  description = "Name of ISO image downloaded on Proxmox"
  type        = string
}

variable "cpu_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores."
}

variable "cpu_sockets" {
  type        = number
  default     = 1
  description = "Number of CPU sockets."
}

variable "memory_mb" {
  type        = number
  default     = 2048
  description = "Amount of RAM in MB."
}

variable "memory_balloon" {
  type        = number
  default     = 0
  description = "Balloon memory target. Set to 0 to disable."
}

variable "disk_interface" {
  type        = string
  default     = "virtio0"
  description = "Disk interface type."
}

variable "disk_size" {
  type        = number
  default     = 20
  description = "Size of the disk in GB."
}

variable "ipv4_address" {
  type = string
  default = "dhcp"
  description = "ipv4 address with cidr block"
}

variable "ipv4_gateway" {
  type = string
  default = "192.168.15.1"
  description = "ipv4 gateway address (ignored when ipv4_address is dhcp)"
}
