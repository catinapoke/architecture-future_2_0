variable "cores" {
  type        = number
  description = "Количество ядер"
  default     = 2
}

variable "memory" {
  type        = number
  description = "Объём RAM"
  default     = 2
}

variable "disk_id" {
  type        = string
  description = "Disk ID"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "ssh_key" {
  type        = string
  description = "SSH-ключ"
}