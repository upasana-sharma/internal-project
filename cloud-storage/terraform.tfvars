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

/******************************************
  Storage Bucket Details
 *****************************************/

storage_buckets = {
  storage_bucket_01 = {
    name               = "terraform-vet-bucket"
    project_id         = "searce-playground-v1"
    location           = "asia-south1"
    versioning         = false
    storage_class      = "STANDARD"
    bucket_policy_only = false
    force_destroy      = false
    # labels = {
    #   environment = "platform",
    #   shared      = "yes",
    #   billedto    = "fk-warehouse-b2b-cron",
    #   createdby   = "terraform",
    #   purpose     = "poc"
    # }
    retention_policy = null
  }
}
