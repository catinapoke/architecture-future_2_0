terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}


provider "yandex" {
  # Параметры cloud_id, folder_id и token не указываются, так как
  # провайдер автоматически подхватит их из переменных окружения

  zone = "ru-central1-a" # Указание региона провайдера
}

module "vm" {
  source = "./modules/vm"
  cores = var.cores
  memory = var.memory
  disk_id = yandex_compute_disk.boot-disk-1.id
  subnet_id = yandex_vpc_subnet.subnet-1.id
  ssh_key = "someuser:${file(pathexpand("~/.ssh/cloudru.pub"))}"
}

resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = var.zone
  size     = 20
  image_id = var.image_id
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}