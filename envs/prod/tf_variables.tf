variable "instances" {
  type      = list(string)
}

variable "password_store_paths" {
  type        = list(string)
  default     = []
  description = "Password storage path"
}
