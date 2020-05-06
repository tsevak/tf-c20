variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {
  default = "ap-sydney-1"
}
variable "compartment_ocid" {}
variable "vcn_display_name" {
  default = "test-vcn"
}
variable "private_key_password" {}

variable "vcn_cidr" {
  default = "192.168.0.0/16"
}

variable "instance_display_name" {
  default = "first_vm"
}

variable "subnet_ocids" {
  type    = "list"
  default = ["192.168.0.0/17"]
}
variable "source_ocid" {
  default     = "ocid1.image.oc1.ap-sydney-1.aaaaaaaacred4yprbcipoynd3xafrhkqw3uyrsjtx7evc23ued5tmydx55dq"
  description = "centos7"
}
variable "ssh_authorized_keys" {}

variable "block_storage_sizes_in_gbs" {
  type    = "list"
  default = [60, 70]
}













