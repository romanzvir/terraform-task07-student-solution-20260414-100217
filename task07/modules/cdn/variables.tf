variable "sdn_rg_name" {
  type        = string
  description = "name of resource group"
}

variable "sdn_hostname_sa" {
  type        = string
  description = "Hostname for frontdoor origin"
}

variable "frontdoor_prof_name" {
  type        = string
  description = "Frontdoor' profile name"
}

variable "frontdoor_prof_sku" {
  type        = string
  description = "Sku of frontdoor pofile"
}

variable "frontdoor_endp_name" {
  type        = string
  description = "Name of frontdoor endpoint"
}

variable "frontdoor_orig_gr_name" {
  type        = string
  description = "Name of frontdoor origin group"
}

variable "frontdoor_orig_name" {
  type        = string
  description = "Name of frontdoor origin"
}

variable "frontdoor_route_name" {
  type        = string
  description = "Name of frontdoor route"
}

variable "tag" {
  type        = map(any)
  description = "My Tag"
}

variable "hostname_frontdoor_end" {
  type        = string
  description = "Has a Hostname of primary blob host"
}

variable "location" {
  type        = string
  description = "location where resources will be deployed"
}

variable "stora_ac_id" {
  type        = string
  description = "Storage account's id"
}