resource "oci_vault_secret" "vault_secrets" {
  for_each = var.vault_secrets

  compartment_id         = each.value.compartment_id
  key_id                 = each.value.key_id
  secret_name            = each.value.secret_name
  vault_id               = each.value.vault_id
  defined_tags           = each.value.defined_tags
  description            = each.value.description
  enable_auto_generation = each.value.enable_auto_generation
  freeform_tags          = each.value.freeform_tags
  metadata               = each.value.metadata

  dynamic "replication_config" {
    for_each = each.value.replication_config != null ? [each.value.replication_config] : []
    content {
      is_write_forward_enabled = replication_config.value.is_write_forward_enabled
      dynamic "replication_targets" {
        for_each = replication_config.value.replication_targets
        content {
          target_key_id   = replication_targets.value.target_key_id
          target_region   = replication_targets.value.target_region
          target_vault_id = replication_targets.value.target_vault_id
        }
      }
    }
  }

  dynamic "rotation_config" {
    for_each = each.value.rotation_config != null ? [each.value.rotation_config] : []
    content {
      is_scheduled_rotation_enabled = rotation_config.value.is_scheduled_rotation_enabled
      rotation_interval             = rotation_config.value.rotation_interval
      target_system_details {
        adb_id             = rotation_config.value.target_system_details.adb_id
        function_id        = rotation_config.value.target_system_details.function_id
        target_system_type = rotation_config.value.target_system_details.target_system_type
      }
    }
  }

  dynamic "secret_content" {
    for_each = each.value.secret_content != null ? [each.value.secret_content] : []
    content {
      content      = secret_content.value.content
      content_type = secret_content.value.content_type
      name         = secret_content.value.name
      stage        = secret_content.value.stage
    }
  }

  dynamic "secret_generation_context" {
    for_each = each.value.secret_generation_context != null ? [each.value.secret_generation_context] : []
    content {
      generation_template = secret_generation_context.value.generation_template
      generation_type     = secret_generation_context.value.generation_type
      passphrase_length   = secret_generation_context.value.passphrase_length
      secret_template     = secret_generation_context.value.secret_template
    }
  }

  dynamic "secret_rules" {
    for_each = each.value.secret_rules != null ? each.value.secret_rules : []
    content {
      is_enforced_on_deleted_secret_versions        = secret_rules.value.is_enforced_on_deleted_secret_versions
      is_secret_content_retrieval_blocked_on_expiry = secret_rules.value.is_secret_content_retrieval_blocked_on_expiry
      rule_type                                     = secret_rules.value.rule_type
      secret_version_expiry_interval                = secret_rules.value.secret_version_expiry_interval
      time_of_absolute_expiry                       = secret_rules.value.time_of_absolute_expiry
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

