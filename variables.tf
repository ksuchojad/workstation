variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ami_win_server_2022" {
  type        = string
  default     = "ami-0e23a322025f616d5"
  description = "ami with Windows Server 2022 from the AMIs Catalog Quick Start"
}

variable "ami_ubuntu_xorg" {
  type        = string
  default     = "ami-02bd3db6ec68f9370"
  description = "ami that has been built with xorg for RDP connectivity"
}
