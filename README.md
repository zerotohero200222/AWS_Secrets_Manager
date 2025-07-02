# AWS_Secrets_Manager
---

# AWS Secrets Manager Deployment using Terraform and GitHub Actions

## Overview

This project demonstrates how to deploy AWS Secrets Manager resources using Terraform, with automation handled through GitHub Actions. It is structured to support reusable environments (such as dev, test, and prod) using variable files, and is designed for safe, modular deployment without automated destruction.

## What is AWS Secrets Manager?

AWS Secrets Manager is a service for securely storing, managing, and retrieving sensitive information such as database credentials, API keys, and other secrets. It supports secret rotation, access control, auditing, and integrates with AWS services like Lambda and RDS.


## Purpose of Each File

* `main.tf`: Contains the main Terraform configuration for deploying the secret.
* `providers.tf`: Configures Terraform to use AWS as the provider.
* `variables.tf`: Declares all configurable inputs used in the module.
* `variables.tfvars`: Contains values for a specific environment such as dev.
* `outputs.tf`: Outputs useful information after deployment (like secret ARN).
* `.github/workflows/terraform-deploy.yml`: GitHub Actions CI/CD workflow for deploying infrastructure automatically.

## GitHub Actions Workflow

The CI/CD pipeline is triggered manually through GitHub Actions and performs the following tasks:

1. Checks out the repository.
2. Sets up the Terraform environment.
3. Authenticates to AWS using credentials stored in GitHub Secrets.
4. Initializes Terraform configuration.
5. Plans the changes.
6. Applies the changes to deploy resources to AWS.

Note: The workflow is limited to the apply operation. It does not include any automated destroy functionality to prevent accidental deletion of secrets.

## AWS Authentication

To authenticate with AWS, the GitHub repository must be configured with the following secrets:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

These should have the necessary IAM permissions to provision Secrets Manager and related services.

## Variable Management

All environment-specific values are stored in a `.tfvars` file. This makes the infrastructure modular and reusable across environments. For example:

```hcl
secret_name  = "dev-api-key"
secret_value = "secure-api-token"
environment  = "dev"
```

To use this setup for different environments, simply create a new `variables.tfvars` file (e.g., `prod.tfvars`) and adjust the values accordingly.

## Deployment Instructions

1. Clone this repository to your local system.

2. Configure GitHub repository secrets:

   * Go to GitHub > Settings > Secrets and variables > Actions
   * Add `AWS_ACCESS_KEY_ID`
   * Add `AWS_SECRET_ACCESS_KEY`

3. Modify the `variables.tfvars` file with your secret name, value, and environment.

4. Navigate to the Actions tab in GitHub and trigger the Terraform Deploy workflow manually.

## Outputs

After deployment, the pipeline will provide outputs such as:

* The name of the secret
* The ARN (Amazon Resource Name) of the secret

These outputs can be referenced in other modules or used by applications that require access to secrets.

## Best Practices

* Do not store sensitive data (like actual secrets) in plaintext or in the version control system.
* Use strong naming conventions for secrets per environment.
* Restrict IAM roles and policies to limit access to Secrets Manager.
* Regularly rotate secrets where applicable.

## Extensions

This setup can be extended to include:

* Automatic secret rotation with AWS Lambda
* Integration with application environments (ECS, EKS, Lambda)
* Versioned secrets and multi-region replication


