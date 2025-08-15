variable "env" {
  type = string

  validation {
    condition     = length(var.env) >= 3
    error_message = "env name must be >= 3 characters."
  }
}
