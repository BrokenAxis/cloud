variable "region" {
  type        = string
  description = "GCP Region"
  default     = "australia-southeast1-a"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "percentsurcharge"
}

variable "cloudrun_registry_id" {
  type        = string
  description = "Artifact Registry Repository"
  default     = "cloudrun-registry"
}
