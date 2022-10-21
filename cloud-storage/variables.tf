/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "storage_buckets" {
  description = "The details of the Cloud Storage Buckets."
  type = map(object({
    name               = string,
    project_id         = string,
    location           = string,
    versioning         = bool,
    storage_class      = string,
    bucket_policy_only = bool,
    force_destroy      = bool,
    # labels             = map(string),
    retention_policy = object({
      is_locked        = bool
      retention_period = number
    })
  }))
  default = {
    storage_bucket = {
      name               = ""
      project_id         = ""
      location           = ""
      versioning         = true
      storage_class      = ""
      bucket_policy_only = true
      force_destroy      = false
      # labels             = {}
      retention_policy   = null
    }
  }
}