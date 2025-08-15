resource "aws_kms_key" "vault_unseal" {
  description              = "Key used for vault-unsealer ${var.env}"
  deletion_window_in_days  = 10
  enable_key_rotation      = true
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
}

resource "aws_kms_alias" "vault_unseal" {
  name_prefix          = "alias/vault-unsealer-${var.env}"
  target_key_id = aws_kms_key.vault_unseal.key_id
}
