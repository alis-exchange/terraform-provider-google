terraform {
  required_providers {
    google = {
      source = "alis.exchange/db/alis"
    }
  }
  required_version = ">= 1.1.0"
}

provider "google" {
  host = "localhost:8080"
}

data "alis_bigtable_table_iam_policy" "policy" {
  project  = var.ALIS_OS_PROJECT
  instance = var.ALIS_OS_BIGTABLE_INSTANCE
  table    = "tf-test"
}

output "test_iam" {
  description = "The IAM policy for the table"
  value       = data.alis_bigtable_table_iam_policy.policy
}