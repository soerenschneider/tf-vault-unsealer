variable "instance_name" {
  type = string

  validation {
    condition     = length(var.instance_name) >= 3
    error_message = "Instance name must be >= 3 characters."
  }
}

variable "env" {
  type = string

  validation {
    condition     = length(var.env) >= 3
    error_message = "env name must be >= 3 characters."
  }
}

variable "key_arn" {
  type = string
}
