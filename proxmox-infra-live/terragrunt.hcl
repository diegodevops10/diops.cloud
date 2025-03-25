# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Load some configurations at root level
  proxmox_endpoint = "https://192.168.15.77:8006/"
  proxmox_api_token = get_env("PROXMOX_API_CRED", "MISSING_TOKEN")
  proxmox_domain_name = "diops.cloud"
}

# Generate provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "proxmox" {
  endpoint  = "${local.proxmox_endpoint}"
  insecure  = true
  api_token = "${local.proxmox_api_token}"
  ssh {
    agent    = true
    username = "root"
  }
}
EOF
}

# Configure remote state
remote_state {
  backend = "s3"
  config = {
    encrypt                            = false
    bucket                             = "terraform-state"
    region                             = "us-east-1"  # any value, MinIO ignores this
    endpoint                           = "http://localhost:9000"
    key                                = "${path_relative_to_include()}/terraform.tfstate"
    disable_aws_client_checksums       = true
    skip_bucket_ssencryption           = true
    skip_bucket_public_access_blocking = true
    skip_bucket_enforced_tls           = true
    skip_bucket_root_access            = true
    skip_credentials_validation        = true
    force_path_style                   = true
    skip_requesting_account_id         = true
  }
}
