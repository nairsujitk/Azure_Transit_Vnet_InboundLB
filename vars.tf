variable "sub_id" {
    default = ""
}
variable "clnt_id" {
    default = ""
}
variable "clnt_sec" {
    default = ""
}
variable "tnt_id" {
    default = ""
}
variable "rg_name" {}
variable "location" {
    defult = "West India"
}
variable "hub-vnet-name" {}
variable "app1-vnet-name" {}
variable "app2-vnet-name" {}
variable "hub-cidr" {}
variable "app1-cidr" {}
variable "app2-cidr" {}
variable "allowall" {}
variable "mgmtSubnetName" {}
variable "mgmtSubnet" {}
variable "untrustSubnetName" {}
variable "untrustSubnet" {}
variable "trustSubnetName" {}
variable "trustSubnet" {}
variable "app1SubnetName" {}
variable "app1Subnet" {}
variable "app2SubnetName" {}
variable "app2Subnet" {}
variable "instancetype" {}
variable "instanceSku" {}
variable "instanceVersion" {}
variable "adminUsername" {}
variable "adminPassword" {}
variable "www_script_path1" {}
variable "www_script_path2" {}
variable "bootstrap_sa1" {
    default = ""
}
variable "sa_key1" {
    default = ""
}
variable "file_share1" {
    default = ""
}
variable "share_dir1" {
    default = ""
}
variable "bootstrap_sa2" {
    default = ""
}
variable "sa_key2" {
    default = ""
}
variable "file_share2" {
    default = ""
}
variable "share_dir2" {
    default = ""
}
variable "mysourceip" {
    default = ""
} 
