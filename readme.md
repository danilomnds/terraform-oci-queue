# Module - Oracle Queue
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![OCI](https://img.shields.io/badge/provider-OCI-red)](https://registry.terraform.io/providers/oracle/oci/latest)

Module developed to standardize the creation of Oracle Queue.

## Compatibility Matrix

| Module Version | Terraform Version | OCI Version     |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.9.5            | 6.8.0           |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Default use case
```hcl
module "queue-<region>-<env>-<system>-<id>" {    
  source              = "git::https://github.com/danilomnds/terraform-oci-queue?ref=v1.0.0"  
  compartment_id = <compartment id>
  display_name = "queue-vcp-prd-coe-001"  
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }  
}
output "queue_name" {
  value = module.queue-<region>-<env>-<system>-<id>.display_name
}
output "queue_id" {
  value = module.queue-<region>-<env>-<system>-<id>.id
}
```

## Custom use case plus RBAC
```hcl
module "queue-<region>-<env>-<system>-<id>" {    
  source              = "git::https://github.com/danilomnds/terraform-oci-queue?ref=v1.0.0"  
  compartment_id = <compartment id>
  display_name = "queue-vcp-prd-coe-001"  
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }
  compartment = <compartment name>
  # GRP_OCI_APP-ENV is the Azure AD group that you are going to grant the permissions
  groups = ["OracleIdentityCloudService/GRP_OCI_APP-ENV", "group name 2"]
}
output "queue_name" {
  value = module.queue-<region>-<env>-<system>-<id>.display_name
}
output "queue_id" {
  value = module.queue-<region>-<env>-<system>-<id>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| channel_consumption_limit | the percentage of allocated queue resources that can be consumed by a single channel | `string` | n/a | No |
| compartment_id | the ocid of the compartment containing the queue | `string` | n/a | `Yes` |
| custom_encryption_key_id | the ocid of the custom encryption key to be used to encrypt messages content | `string` | n/a | No |
| dead_letter_queue_delivery_count | the number of times a message can be delivered to a consumer before being moved to the dead letter queue | `string` | n/a | No |
| defined_tags | Defined tags for this resource | `map(string)` | n/a | No |
| display_name | the user-friendly name of the queue | `string` | n/a | `Yes` |
| freeform_tags | Free-form tags for this resource | `map(string)` | n/a | No |
| retention_in_seconds | the retention period of messages in the queue, in seconds | `number` | n/a | No |
| timeout_in_seconds | the default polling timeout of the messages in the queue, in seconds | `number` | n/a | No |
| visibility_in_seconds | the default visibility timeout of the messages consumed from the queue, in seconds | `number` | n/a | No |
| purge_trigger | an optional property when incremented triggers purge | `string` | n/a | No |
| purge_type | an optional value that specifies the purge behavior for the queue. could be set to normal, dlq or both | `string` | n/a | No |

## Output variables

| Name | Description |
|------|-------------|
| display_name | queue name|
| id | queue id |

## Documentation
Oracle Queue: <br>
[https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/queue_queue](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/queue_queue)