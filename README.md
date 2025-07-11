# 🚀 AWS Secrets Manager Terraform Deployment

This repository provisions AWS Secrets Manager secrets using Terraform. It features a fully automated CI/CD pipeline powered by GitHub Actions, including:

- Cost estimation before applying changes.
- Manual approval for applying changes.
- Remote state storage using S3 backend.
- Environment-specific configurations (Dev, UAT, Prod).

---

## 📁 Project Structure

The project is organized as follows:

- `main.tf` — Defines AWS Secrets Manager resources.
- `provider.tf` — Configures the AWS provider and Terraform version.
- `variables.tf` — Input variable declarations.
- `outputs.tf` — Outputs such as the secret name and ARN.
- `backend.tf` — Configures remote state using an S3 backend.
- `environments/` — Environment-specific `.tfvars` files.
- `.github/workflows/terraform-deploy.yml` — GitHub Actions CI/CD workflow.

---

## 🔧 Features

- Supports multiple environments (Dev, UAT, Prod).
- Secrets are generated with a random suffix for uniqueness.
- Remote state management via S3 with versioning and encryption.
- Terraform plan output is uploaded as an artifact.
- Cost estimate summary is displayed after the plan step.
- Apply step requires manual approval for secure deployment.

---

## 🚀 GitHub Actions Workflow

This project includes a two-stage deployment workflow:

1. **Plan Job**
   - Runs on every push to `main`.
   - Initializes Terraform and runs `terraform plan`.
   - Displays a cost estimation summary.
   - Uploads the plan as an artifact.

2. **Apply Job**
   - Requires manual approval.
   - Downloads the plan artifact and runs `terraform apply`.

Both jobs use AWS credentials stored securely as GitHub Secrets.

---

## 🔐 Required GitHub Secrets

To authenticate with AWS, set the following secrets in your repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 🌍 Environments

Each environment (Dev, UAT, Prod) has its own `.tfvars` file located in the `environments/` folder. These files define:

- AWS region
- Secret name
- Secret value
- Secret description
- Deployment environment label

You can change or add environments by creating additional `.tfvars` files and updating the workflow if needed.

---

## 🪣 S3 Backend

Terraform state is stored in an S3 bucket to enable collaboration and preserve state across runs. The backend is:

- Encrypted using AES256
- Versioned for safety
- Created dynamically by the CI/CD pipeline if it doesn’t already exist

---

## 📈 Cost Estimation

After every plan, a cost summary is displayed directly in the GitHub Actions step summary. This helps reviewers understand the approximate charges before applying.

---

## 📦 Deployment Process

1. Push your changes to the `main` branch.
2. GitHub Actions will run the plan job and show the cost estimation.
3. A team lead or reviewer must approve the apply job manually in the `Actions` tab.
4. Once approved, Terraform will apply the planned changes using the stored plan artifact.

---

## 🧪 Testing & Validation

- Validates Terraform syntax and backend configuration.
- Ensures idempotent and repeatable infrastructure deployments.
- Secrets are tagged and version-controlled.

---



