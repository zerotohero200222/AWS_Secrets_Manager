variable "aws_region" {
  type        = string
  description = "AWS region to deploy the resources"
  default     = "us-east-2"
}

variable "secret_name" {
  type        = string
  description = "Base name of the secret."
}

variable "secret_description" {
  type        = string
  description = "Description of the secret."
}

variable "secret_value" {
  type        = string
  description = "Secret value to be stored in Secrets Manager."
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "Deployment environment: dev/test/prod."
}

# outputs.tf
output "secret_name" {
  value = aws_secretsmanager_secret.app_secret.name
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app_secret.arn
}
