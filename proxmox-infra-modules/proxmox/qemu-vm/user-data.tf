resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = var.datastore_volume_name
  node_name    = var.node_name

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.machine_name}
    users:
      - default
      - name: ubuntu
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    runcmd:
        - apt update
        - apt install -y qemu-guest-agent net-tools
        - timedatectl set-timezone America/Toronto
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
        - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-${var.machine_name}.yaml"
  }
}
