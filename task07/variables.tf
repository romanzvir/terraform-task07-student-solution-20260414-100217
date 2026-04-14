variable "location" {
  type        = string
  description = "location where resources will be deployed"
}

variable "rg_name" {
  type        = string
  description = "name of resource group"
}

variable "rg_id" {
  type        = string
  description = "resource group id"
}

variable "sa_name" {
  type        = string
  description = "Name of storage account"
}

variable "sa_id" {
  type        = string
  description = "Id of storage account"
}

variable "blob_file" {
  type        = string
  description = "Filename in storage account"
}

variable "fd_profile_name" {
  type        = string
  description = "Front door's profile name"
}

variable "fd_profile_sku" {
  type        = string
  description = "Front door's SKU"
}

variable "fd_endpoint_name" {
  type        = string
  description = "Front door's endpoint name"
}

variable "fd_origin_group_name" {
  type        = string
  description = "Front door's origin group name"
}

variable "fd_origin_name" {
  type        = string
  description = "Front Door's origin name"
}

variable "fd_route_name" {
  type        = string
  description = "Front Door's route name"
}

variable "tag" {
  type        = map(any)
  description = "My Tag"
}