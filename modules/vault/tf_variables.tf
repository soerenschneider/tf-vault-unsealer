variable "instance_name" {
  type = string

  validation {
    condition     = length(var.instance_name) >= 3 && length(var.instance_name) <= 64
    error_message = "The instance name must be between 3 and 64 characters long"
  }

  description = "Name of the instances the users belong to."
}

variable "access_keys" {
  type = object({
    name       = string,
    access_key = string,
    secret_key = string
  })
  description = "Credentials for the appropriate instance."
}

variable "vault_kv2_mount" {
  type    = string
  default = "secret"

  validation {
    condition     = !endswith(var.vault_kv2_mount, "/") && length(var.vault_kv2_mount) > 3
    error_message = "vault_kv2_mount should not end with a slash."
  }

  description = "Path where KV2 secret engine is mounted in Vault."
}

variable "password_store_paths" {
  type        = list(string)
  description = "Paths to write the secret to."

  validation {
    condition = alltrue([
      for path in var.password_store_paths : length(path) >= 5
    ])
    error_message = "Each path in password_store_paths must be at least 5 characters long."
  }

  validation {
    condition = alltrue([
      for path in var.password_store_paths :
      !startswith(path, "/") && !endswith(path, "/")
    ])
    error_message = "Each path in password_store_paths must not start or end with a slash ('/')."
  }

  validation {
    condition = alltrue([
      for path in var.password_store_paths : can(regex("%s", path))
    ])
    error_message = "Each path in password_store_paths must contain the substring '%s'."
  }
}

variable "metadata" {
  type    = map(any)
  default = null

  description = "Optional metadata to attach to the secret data."
}
