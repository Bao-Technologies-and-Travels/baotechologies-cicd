# Staging Infrastructure

Terraform and Jenkins pipeline definitions for the **staging** environment.

## What this manages

- VPC, IAM, and a staging compute instance
- **Staging DNS records only** (in the production-owned zone):
  - `staging.<domain>` (A)
  - `www.staging.<domain>` (CNAME)
  - `jenkins.staging.<domain>` (A)

Staging does **not** create or own the DNS zone. It references the zone in the production project via `dns_project`.

## DNS ownership (no overlap)

| Record | Managed by |
|---|---|
| `<domain>` apex A | production |
| `www.<domain>` | production |
| CAA, Resend, `learn.<domain>` | production |
| `staging.<domain>` | staging |
| `www.staging.<domain>` | staging |
| `jenkins.staging.<domain>` | staging |

## Usage

```bash
cd staging
cp terraform.tfvars.example terraform.tfvars
# Set dns_project to baotechnologies-prod
terraform init
terraform plan
terraform apply
```

## Remove the old staging-project zone

If you previously had a `prod-zone` in `baotechnologies-staging`, it is orphaned after migration. After staging records exist in the prod zone and your registrar NS point to the **prod** nameservers:

```bash
gcloud dns managed-zones delete prod-zone --project=baotechnologies-staging
```

## Jenkins pipelines

- `Jenkinsfile-backend` / `Jenkinsfile-frontend` deploy to `staging.<domain>`
