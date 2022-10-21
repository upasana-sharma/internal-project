# Cloud Storage Module

This module makes it easy to create a GCS bucket, and assign basic permissions on it to arbitrary users.

The resources/services/activations/deletions that this module will create/trigger are:

- One GCS bucket
- Zero or more IAM bindings for that bucket

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "storage_buckets" {
  source             = "../modules/terraform-google-cloud-storage/"
  for_each           = var.storage_buckets
  project_id         = each.value.project_id
  name               = each.value.name
  location           = each.value.location
  versioning         = each.value.versioning
  storage_class      = each.value.storage_class
  bucket_policy_only = each.value.bucket_policy_only
  force_destroy      = each.value.force_destroy
  labels             = each.value.labels
  retention_policy   = each.value.retention_policy
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| storage\_buckets | The details of the Cloud Storage Buckets. | <pre>map(object({<br>    name               = string,<br>    project_id         = string,<br>    location           = string,<br>    versioning         = bool,<br>    storage_class      = string,<br>    bucket_policy_only = bool,<br>    force_destroy      = bool,<br>    labels             = map(string),<br>    retention_policy = object({<br>      is_locked        = bool<br>      retention_period = number<br>    })<br>  }))</pre> | <pre>storage_bucket = {<br>      name               = ""<br>      project_id         = ""<br>      location           = ""<br>      versioning         = true<br>      storage_class      = ""<br>      bucket_policy_only = true<br>      force_destroy      = false<br>      labels             = {}<br>      retention_policy   = null<br>    }</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| storage\_buckets | The details of the created Cloud Storage Buckets. | 

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/storage.admin` on the seed project

## APIs

In order to operate this module, you must activate the following APIs on
the project:

- Cloud Storage API - `storage.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0