variable "rg_name" {
  type = string
  default = "terra-intro"
}

variable "location_name" {
  type = string
  default = "centralindia"
}

variable "vnet_address" {
    type = list (string)
    default = [ "10.0.0.0/16","10.1.0.0/16" ]  
}