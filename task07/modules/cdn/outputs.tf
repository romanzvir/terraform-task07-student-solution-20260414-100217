output "endpoint_hostname" {
  value       = azurerm_cdn_frontdoor_endpoint.frontdoor_endp.host_name
  description = "Cdn frontdoor's hostname"
}