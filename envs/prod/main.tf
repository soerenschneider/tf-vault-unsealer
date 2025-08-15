locals {
  env                     = basename(abspath(path.module))
  password_store_paths_default = ["machine/%s/vault-unsealer"]
}

module "key" {
  source   = "../../modules/aws-kms"
  env = local.env
}

module "instances" {
  for_each             = { for instance in var.instances : instance => instance }
  source               = "../../modules/aws-iam"
  instance_name            = each.key
  env = local.env
  key_arn = module.key.key_arn
}

module "vault" {
  for_each             = { for instance in var.instances : instance => instance }
  source               = "../../modules/vault"
  instance_name = each.key
  access_keys          = nonsensitive(module.instances[each.key].access_keys)
  password_store_paths = coalescelist(var.password_store_paths, local.password_store_paths_default)
  metadata             = {}
}
