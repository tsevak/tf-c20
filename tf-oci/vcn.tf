module "vcn" {
  source           = "oracle-terraform-modules/default-vcn/oci"
  compartment_ocid = var.compartment_ocid
  vcn_display_name = var.vcn_display_name
  vcn_cidr         = var.vcn_cidr
}