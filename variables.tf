variable "title" {
  description = "Name of the timeboard"
  default     = "Vault Runtime Status (TF)"
}

variable "description" {
  description = "Description of the timeboard's content"
  default     = "(Created by Terraform) Timeboard showing Vault metrics"
}

variable "read_only" {
  description = "Makes the timeboard read-only"
  default     = true
}

variable "template_variable_default" {
  description = "Default value for the `$vault_cluster` template variable"
  default     = "*"
}

variable "template_variable_prefix" {
  description = "Tag group for the `$vault_cluster` template variable"
  default     = null
}