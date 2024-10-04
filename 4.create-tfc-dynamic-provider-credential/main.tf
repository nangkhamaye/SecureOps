# Enable JWT Auth method and write configuration
resource "vault_jwt_auth_backend" "jwt" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "jwt"
    oidc_discovery_url  = "https://app.terraform.io"
    bound_issuer        = "https://app.terraform.io"
}

# Create Role Policy
resource "vault_policy" "admin-policy" {
  name = "admin-policy"

  policy = <<EOT
path "" {
  
}
EOT
}

# Create JWT Role
resource "vault_jwt_auth_backend_role" "example" {
  backend           = vault_jwt_auth_backend.secureops-jwt-backend.path
  role_name         = "vault-jtw-auth-role"
  token_policies    = [vault_policy.admin-policy.name]

  bound_audiences   = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims      = {
    sub = "organization:hellocloud-cohort6:project:SecureOps:workspace:*:run_phase:*"
  }
  user_claim        = "terraform_full_workspace"
  role_type         = "jwt"
  token_ttl         = 1200
}