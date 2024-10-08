resource "oci_queue_queue" "queue" {
  channel_consumption_limit        = var.channel_consumption_limit
  compartment_id                   = var.compartment_id
  custom_encryption_key_id         = var.custom_encryption_key_id
  dead_letter_queue_delivery_count = var.dead_letter_queue_delivery_count
  defined_tags                     = local.defined_tags
  display_name                     = var.display_name
  freeform_tags                    = var.freeform_tags
  retention_in_seconds             = var.retention_in_seconds
  timeout_in_seconds               = var.timeout_in_seconds
  visibility_in_seconds            = var.visibility_in_seconds
  purge_trigger                    = var.purge_trigger
  purge_type                       = var.purge_type
  lifecycle {
    ignore_changes = [
      defined_tags["IT.create_date"]
    ]
  }
}

resource "oci_identity_policy" "queue_policy" {
  #if you are deploying the resource outside your home region uncomment the line below
  #provider   = oci.home-region
  depends_on = [oci_queue_queue.queue]
  for_each = {
    for group in var.groups : group => group
    if var.groups != [] && var.compartment != null
  }
  compartment_id = var.compartment_id
  name           = "policy_${var.display_name}"
  description    = "allow one or more groups to manage objects inside a bucket"
  statements = [
    "Allow group ${each.value} to read queues in compartment ${var.compartment} where target.queue.id = '${oci_queue_queue.queue.id}'",
    "Allow group ${each.value} to use queue-push in compartment ${var.compartment} where target.queue.id = '${oci_queue_queue.queue.id}'",
    "Allow group ${each.value} to use queue-pull in compartment ${var.compartment} where target.queue.id = '${oci_queue_queue.queue.id}'"
  ]
}