resource "vault_kv_secret_v2" "tokens" {
  for_each            = { for idx, path in var.password_store_paths : idx => path }
  mount               = var.vault_kv2_mount
  name                = try(format(each.value, var.instance_name), each.value)
  delete_all_versions = true
  data_json = jsonencode(
    {
      AWS_ACCESS_KEY_ID     = var.access_keys.access_key
      AWS_SECRET_ACCESS_KEY = var.access_keys.secret_key
    }
  )
  custom_metadata {
    max_versions = 1
    data         = merge(local.metadata_default, var.metadata)
  }
}

locals {
  metadata_default = {
    repo       = "https://github.com/soerenschneider/tf-vault-unsealer"
    managed-by = "terraform"
  }
}
