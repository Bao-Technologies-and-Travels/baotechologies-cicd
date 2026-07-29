# Production Infrastructure

Terraform and Jenkins pipeline definitions for the **production** environment.

## What this manages

- VPC, IAM, and a production compute instance
- **Cloud DNS zone** for the root domain (single source of truth)
- Production DNS records: apex (`<domain>`), `www.<domain>`
- Shared DNS records: CAA, Resend (email), `learn.<domain>`

Staging subdomains are managed separately in `../staging/`.

## DNS ownership (no overlap)

| Record | Managed by |
|---|---|
| DNS zone `prod-zone` | **production only** |
| `<domain>` apex A | production |
| `www.<domain>` | production |
| CAA, Resend, `learn.<domain>` | production |
| `staging.<domain>` | staging |
| `www.staging.<domain>` | staging |
| `jenkins.staging.<domain>` | staging |

## Usage

```bash
cd production
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

After apply, point your domain registrar nameservers to `terraform output dns_name_servers`.

## Jenkins pipelines

- `Jenkinsfile-backend` / `Jenkinsfile-frontend` deploy to `<domain>` (e.g. `baotechnologies.com`)
