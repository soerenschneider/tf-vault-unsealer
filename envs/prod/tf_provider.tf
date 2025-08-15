terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "4.2.0"
    }
  }

  encryption {
    method "aes_gcm" "default" {
      keys = key_provider.pbkdf2.mykey
    }

    state {
      enforced = true
      method   = method.aes_gcm.default
    }
    plan {
      method   = method.aes_gcm.default
      enforced = true
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      env        = local.env
      repo       = "https://github.com/soerenschneider/tf-vault-unsealer"
      managed-by = "terraform"
    }
  }
}

provider "vault" {
  address = "https://vault.ha.soeren.cloud"
}
