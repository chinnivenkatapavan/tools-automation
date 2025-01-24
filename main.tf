module "vm" {
    for_each     = var.tools
    source       = "./vm-module"
    component    = each.key
    ssh_username = var.ssh_username
    ssh_password = var.ssh_password
    port         = each.value["port"]
    }

variable "tools" {

    default = {

        vault = {
            port = 8200
            }

        }

    }