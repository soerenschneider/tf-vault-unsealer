resource "aws_iam_policy" "kms_encrypt_decrypt" {
  name        = "vault-unsealer-${var.env}-${var.instance_name}"
  description = "Policy to allow encryption and decryption with the example KMS key"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowEncryptDecrypt"
        Effect   = "Allow"
        Action   = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = var.key_arn
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.kms_encrypt_decrypt.arn
}

resource "aws_iam_user" "s3_user" {
  name = "vault-unsealer-${var.env}-${var.instance_name}"
  path = "/system/tf-vault-unsealer-${var.env}/"
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.s3_user.name
}
