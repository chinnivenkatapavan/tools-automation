module "vm" {
    for.each     = var.tools
    source       = "./vm-module"
    component    = each.key
    ssh_username = ""
    ssh_password = ""

    }

variable "tools" {

    default = {

        vault = {


            }

        }

    }