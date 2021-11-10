# GCP - Creating a Project with Terraform

The files in this repo create an empty Google Cloud Platform (GCP) Project in a GCP Organisation.

## Usage
Either update the `variables.tf` file, setting a default value for the `organisation_id` and `billing_account_id` variables, or set the values as environment variables:
```bash
export TF_VAR_organisation_id="<ORGANISATION_ID>"
export TF_VAR_billing_account_id="<BILLING_ACCOUNT_ID>"
```

Running `terraform init` followed by `terrform apply` will then create a GCP Project called "playground-project-XXXXXX".
