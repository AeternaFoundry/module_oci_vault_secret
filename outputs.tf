output "vault_secrets_id" {
  description = "Map of id values across all vault_secrets, keyed the same as var.vault_secrets except keys with no id are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vault_secrets_compartment_id" {
  description = "Map of compartment_id values across all vault_secrets, keyed the same as var.vault_secrets except keys with no compartment_id are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "vault_secrets_current_version_number" {
  description = "Map of current_version_number values across all vault_secrets, keyed the same as var.vault_secrets except keys with no current_version_number are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.current_version_number if v.current_version_number != null && length(v.current_version_number) > 0 }
}
output "vault_secrets_defined_tags" {
  description = "Map of defined_tags values across all vault_secrets, keyed the same as var.vault_secrets except keys with no defined_tags are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "vault_secrets_description" {
  description = "Map of description values across all vault_secrets, keyed the same as var.vault_secrets except keys with no description are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.description if v.description != null && length(v.description) > 0 }
}
output "vault_secrets_enable_auto_generation" {
  description = "Map of enable_auto_generation values across all vault_secrets, keyed the same as var.vault_secrets except keys with no enable_auto_generation are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.enable_auto_generation if v.enable_auto_generation != null }
}
output "vault_secrets_freeform_tags" {
  description = "Map of freeform_tags values across all vault_secrets, keyed the same as var.vault_secrets except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "vault_secrets_is_auto_generation_enabled" {
  description = "Map of is_auto_generation_enabled values across all vault_secrets, keyed the same as var.vault_secrets except keys with no is_auto_generation_enabled are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.is_auto_generation_enabled if v.is_auto_generation_enabled != null }
}
output "vault_secrets_is_replica" {
  description = "Map of is_replica values across all vault_secrets, keyed the same as var.vault_secrets except keys with no is_replica are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.is_replica if v.is_replica != null }
}
output "vault_secrets_key_id" {
  description = "Map of key_id values across all vault_secrets, keyed the same as var.vault_secrets except keys with no key_id are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.key_id if v.key_id != null && length(v.key_id) > 0 }
}
output "vault_secrets_last_rotation_time" {
  description = "Map of last_rotation_time values across all vault_secrets, keyed the same as var.vault_secrets except keys with no last_rotation_time are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.last_rotation_time if v.last_rotation_time != null && length(v.last_rotation_time) > 0 }
}
output "vault_secrets_lifecycle_details" {
  description = "Map of lifecycle_details values across all vault_secrets, keyed the same as var.vault_secrets except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "vault_secrets_metadata" {
  description = "Map of metadata values across all vault_secrets, keyed the same as var.vault_secrets except keys with no metadata are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "vault_secrets_next_rotation_time" {
  description = "Map of next_rotation_time values across all vault_secrets, keyed the same as var.vault_secrets except keys with no next_rotation_time are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.next_rotation_time if v.next_rotation_time != null && length(v.next_rotation_time) > 0 }
}
output "vault_secrets_replication_config" {
  description = "Map of replication_config values across all vault_secrets, keyed the same as var.vault_secrets except keys with no replication_config are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => one(v.replication_config) if v.replication_config != null && length(v.replication_config) > 0 }
}
output "vault_secrets_rotation_config" {
  description = "Map of rotation_config values across all vault_secrets, keyed the same as var.vault_secrets except keys with no rotation_config are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => one(v.rotation_config) if v.rotation_config != null && length(v.rotation_config) > 0 }
}
output "vault_secrets_rotation_status" {
  description = "Map of rotation_status values across all vault_secrets, keyed the same as var.vault_secrets except keys with no rotation_status are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.rotation_status if v.rotation_status != null && length(v.rotation_status) > 0 }
}
output "vault_secrets_secret_content" {
  description = "Map of secret_content values across all vault_secrets, keyed the same as var.vault_secrets except keys with no secret_content are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => one(v.secret_content) if v.secret_content != null && length(v.secret_content) > 0 }
}
output "vault_secrets_secret_generation_context" {
  description = "Map of secret_generation_context values across all vault_secrets, keyed the same as var.vault_secrets except keys with no secret_generation_context are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => one(v.secret_generation_context) if v.secret_generation_context != null && length(v.secret_generation_context) > 0 }
}
output "vault_secrets_secret_name" {
  description = "Map of secret_name values across all vault_secrets, keyed the same as var.vault_secrets except keys with no secret_name are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.secret_name if v.secret_name != null && length(v.secret_name) > 0 }
}
output "vault_secrets_secret_rules" {
  description = "Map of secret_rules values across all vault_secrets, keyed the same as var.vault_secrets except keys with no secret_rules are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.secret_rules if v.secret_rules != null && length(v.secret_rules) > 0 }
}
output "vault_secrets_source_region_information" {
  description = "Map of source_region_information values across all vault_secrets, keyed the same as var.vault_secrets except keys with no source_region_information are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.source_region_information if v.source_region_information != null && length(v.source_region_information) > 0 }
}
output "vault_secrets_state" {
  description = "Map of state values across all vault_secrets, keyed the same as var.vault_secrets except keys with no state are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.state if v.state != null && length(v.state) > 0 }
}
output "vault_secrets_time_created" {
  description = "Map of time_created values across all vault_secrets, keyed the same as var.vault_secrets except keys with no time_created are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "vault_secrets_time_of_current_version_expiry" {
  description = "Map of time_of_current_version_expiry values across all vault_secrets, keyed the same as var.vault_secrets except keys with no time_of_current_version_expiry are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.time_of_current_version_expiry if v.time_of_current_version_expiry != null && length(v.time_of_current_version_expiry) > 0 }
}
output "vault_secrets_time_of_deletion" {
  description = "Map of time_of_deletion values across all vault_secrets, keyed the same as var.vault_secrets except keys with no time_of_deletion are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.time_of_deletion if v.time_of_deletion != null && length(v.time_of_deletion) > 0 }
}
output "vault_secrets_vault_id" {
  description = "Map of vault_id values across all vault_secrets, keyed the same as var.vault_secrets except keys with no vault_id are omitted"
  value       = { for k, v in oci_vault_secret.vault_secrets : k => v.vault_id if v.vault_id != null && length(v.vault_id) > 0 }
}

