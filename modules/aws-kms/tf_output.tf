output "key_arn" {
  value = aws_kms_key.vault_unseal.arn
}

output "key_name" {
  value = aws_kms_alias.vault_unseal.name
}
