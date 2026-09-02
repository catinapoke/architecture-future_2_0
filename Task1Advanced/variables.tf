variable "zone" {
  type        = string
  description = "Зона доступности"
  default     = "ru-central1-a"
}

variable "image_id" {
  type        = string
  description = "ID образа ОС"
  default     = "fd8020c5t6gei8d1rpi1"
}

variable "cores" {
  type        = number
  description = "Количество ядер"
}

variable "memory" {
  type        = number
  description = "Объём RAM"
}
