resource "cloudflare_pipeline_sink" "pipeline_sinks" {
  for_each = var.pipeline_sinks

  account_id = each.value.account_id
  name       = each.value.name
  type       = each.value.type
  config     = each.value.config
  format     = each.value.format
  schema     = each.value.schema
}

