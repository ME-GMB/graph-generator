terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "<= 2.10"
    }
  }
}

variable "ProxmoxUser" {
  type = string
}

variable "ProxmoxPassword" {
  type = string
}
variable "ProxmoxHost" {
  type = string
}

provider "proxmox" {
  pm_user     = var.ProxmoxUser
  pm_password = var.ProxmoxPassword
  pm_api_url  = var.ProxmoxHost
}

resource "proxmox_vm_qemu" "resource_name" {
  iso         = "local:iso/ubuntu-server-22.04.iso"
  vmid        = 100
  name        = "test-node"
  target_node = "Laptop1660"
  cores       = 1
  memory      = 512

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    slot    = 0
    size    = "32G"
    type    = "scsi"
    storage = "local-lvm"
  }
}
