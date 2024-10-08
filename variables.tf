variable "channel_consumption_limit" {
  type    = string
  default = null
}

variable "compartment_id" {
  type = string
}

variable "custom_encryption_key_id" {
  type    = string
  default = null
}

variable "dead_letter_queue_delivery_count" {
  type    = number
  default = null
}

variable "defined_tags" {
  type    = map(string)
  default = null
}

variable "display_name" {
  type = string
}

variable "freeform_tags" {
  type    = map(string)
  default = null
}

variable "retention_in_seconds" {
  type    = number
  default = null
}

variable "timeout_in_seconds" {
  type    = number
  default = null
}

variable "visibility_in_seconds" {
  type    = number
  default = null
}

variable "purge_trigger" {
  type    = number
  default = null
}

variable "purge_type" {
  type    = number
  default = null
}

variable "groups" {
  type    = list(string)
  default = []
}

variable "compartment" {
  type    = string
  default = null
}