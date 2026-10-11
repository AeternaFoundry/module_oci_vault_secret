variable "vault_secrets" {
  description = <<EOT
Map of vault_secrets, attributes below
Required:
    - compartment_id
    - key_id
    - secret_name
    - vault_id
Optional:
    - defined_tags
    - description
    - enable_auto_generation
    - freeform_tags
    - metadata
    - replication_config (block):
        - is_write_forward_enabled (optional)
        - replication_targets (required, block):
            - target_key_id (required)
            - target_region (required)
            - target_vault_id (required)
    - rotation_config (block):
        - is_scheduled_rotation_enabled (optional)
        - rotation_interval (optional)
        - target_system_details (required, block):
            - adb_id (optional)
            - function_id (optional)
            - target_system_type (required)
    - secret_content (block):
        - content (optional)
        - content_type (required)
        - name (optional)
        - stage (optional)
    - secret_generation_context (block):
        - generation_template (required)
        - generation_type (required)
        - passphrase_length (optional)
        - secret_template (optional)
    - secret_rules (block):
        - is_enforced_on_deleted_secret_versions (optional)
        - is_secret_content_retrieval_blocked_on_expiry (optional)
        - rule_type (required)
        - secret_version_expiry_interval (optional)
        - time_of_absolute_expiry (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id         = string
    key_id                 = string
    secret_name            = string
    vault_id               = string
    defined_tags           = optional(map(string))
    description            = optional(string)
    enable_auto_generation = optional(bool)
    freeform_tags          = optional(map(string))
    metadata               = optional(map(string))
    replication_config = optional(object({
      is_write_forward_enabled = optional(bool)
      replication_targets = list(object({
        target_key_id   = string
        target_region   = string
        target_vault_id = string
      }))
    }))
    rotation_config = optional(object({
      is_scheduled_rotation_enabled = optional(bool)
      rotation_interval             = optional(string)
      target_system_details = object({
        adb_id             = optional(string)
        function_id        = optional(string)
        target_system_type = string
      })
    }))
    secret_content = optional(object({
      content      = optional(string)
      content_type = string
      name         = optional(string)
      stage        = optional(string)
    }))
    secret_generation_context = optional(object({
      generation_template = string
      generation_type     = string
      passphrase_length   = optional(number)
      secret_template     = optional(string)
    }))
    secret_rules = optional(list(object({
      is_enforced_on_deleted_secret_versions        = optional(bool)
      is_secret_content_retrieval_blocked_on_expiry = optional(bool)
      rule_type                                     = string
      secret_version_expiry_interval                = optional(string)
      time_of_absolute_expiry                       = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vault_secrets : (
        v.replication_config == null || (length(v.replication_config.replication_targets) >= 1)
      )
    ])
    error_message = "Each replication_targets list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.vault_secrets : (
        v.rotation_config == null || (contains([for v in ["ADB", "FUNCTION"] : lower(v)], lower(v.rotation_config.target_system_details.target_system_type)))
      )
    ])
    error_message = "must be one of: \"ADB\", \"FUNCTION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vault_secrets : (
        v.secret_content == null || (contains([for v in ["BASE64"] : lower(v)], lower(v.secret_content.content_type)))
      )
    ])
    error_message = "must be one of: \"BASE64\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vault_secrets : (
        v.secret_generation_context == null || (contains([for v in ["BYTES", "PASSPHRASE", "SSH_KEY"] : lower(v)], lower(v.secret_generation_context.generation_type)))
      )
    ])
    error_message = "must be one of: \"BYTES\", \"PASSPHRASE\", \"SSH_KEY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vault_secrets : (
        v.secret_rules == null || alltrue([for item in v.secret_rules : (contains([for v in ["SECRET_EXPIRY_RULE", "SECRET_REUSE_RULE"] : lower(v)], lower(item.rule_type)))])
      )
    ])
    error_message = "must be one of: \"SECRET_EXPIRY_RULE\", \"SECRET_REUSE_RULE\""
  }
}

