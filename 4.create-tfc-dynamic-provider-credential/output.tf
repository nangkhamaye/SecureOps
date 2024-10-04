output "bound_claims" {
    description =  "Vault JWT Auth Backend Role's bound_claims" 
    value = vault_jwt_auth_backend_role.example.bound_claims
    }


output "role_name" {
    description =  "Vault JWT Auth Backend Role's  role_name" 
    value = vault_jwt_auth_backend_role.example.role_name
    }