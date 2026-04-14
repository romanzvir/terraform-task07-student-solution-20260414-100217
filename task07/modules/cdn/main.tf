resource "azurerm_cdn_frontdoor_profile" "frontdoor_prof" {
  name                = var.frontdoor_prof_name
  resource_group_name = var.sdn_rg_name
  sku_name            = var.frontdoor_prof_sku

}

resource "azurerm_cdn_frontdoor_endpoint" "frontdoor_endp" {
  name                     = var.frontdoor_endp_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor_prof.id

}

resource "azurerm_cdn_frontdoor_origin_group" "frontdoor_orig_gr" {
  name                     = var.frontdoor_orig_gr_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor_prof.id

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 16
    successful_samples_required        = 3
  }

  health_probe {
    interval_in_seconds = 60
    path                = "/"
    protocol            = "Https"
    request_type        = "HEAD"
  }

}

resource "azurerm_cdn_frontdoor_origin" "frontdoor_orig" {
  name                          = var.frontdoor_orig_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.frontdoor_orig_gr.id

  certificate_name_check_enabled = false
  enabled                        = true

  host_name          = var.hostname_frontdoor_end #https://<mystorageaccount>.blob.core.windows.net/<mycontainer>/<myblob>
  http_port          = 80
  https_port         = 443
  origin_host_header = var.hostname_frontdoor_end

}

resource "azurerm_cdn_frontdoor_route" "frontdoor_route" {
  name                          = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.frontdoor_endp.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.frontdoor_orig_gr.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.frontdoor_orig.id]
  enabled                       = true

  forwarding_protocol    = "MatchRequest"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]

}