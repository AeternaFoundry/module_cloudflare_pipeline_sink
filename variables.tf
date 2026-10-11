variable "pipeline_sinks" {
  description = <<EOT
Map of pipeline_sinks, attributes below
Required:
    - account_id
    - name
    - type
Optional:
    - config
    - format
    - schema
EOT

  type = map(object({
    account_id = string
    name       = string
    type       = string
    config = optional(object({
      account_id = string
      bucket     = string
      credentials = optional(object({
        access_key_id     = string
        secret_access_key = string
      }))
      file_naming = optional(object({
        prefix   = optional(string)
        strategy = optional(string)
        suffix   = optional(string)
      }))
      jurisdiction = optional(string)
      namespace    = optional(string)
      partitioning = optional(object({
        time_pattern = optional(string)
      }))
      path = optional(string)
      rolling_policy = optional(object({
        file_size_bytes    = optional(number)
        inactivity_seconds = optional(number)
        interval_seconds   = optional(number)
      }))
      table_name = optional(string)
      token      = optional(string)
    }))
    format = optional(object({
      compression      = optional(string)
      decimal_encoding = optional(string)
      row_group_bytes  = optional(number)
      timestamp_format = optional(string)
      type             = string
      unstructured     = optional(bool)
    }))
    schema = optional(object({
      fields = optional(list(object({
        metadata_key = optional(string)
        name         = optional(string)
        required     = optional(bool)
        sql_name     = optional(string)
        type         = string
        unit         = optional(string)
      })))
      inferred = optional(bool)
    }))
  }))
}

