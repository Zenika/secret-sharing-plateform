#! /bin/bash
read -p "Enter Auth0 domain (default: zenika.eu.auth0.com): " AUTH0_DOMAIN
read -p "Enter Auth0 client id: " AUTH0_CLIENT_ID
read -p "Enter Auth0 client secret: " AUTH0_CLIENT_SECRET

# Write required policies
vault policy write user user.hcl
vault policy write reader reader.hcl

# Enable oidc authentication
vault auth enable oidc

# Configure oidc auth method
vault write auth/oidc/config \
        oidc_discovery_url="https://${AUTH0_DOMAIN:=zenika.eu.auth0.com}/" \
        oidc_client_id="$AUTH0_CLIENT_ID" \
        oidc_client_secret="$AUTH0_CLIENT_SECRET" \
        default_role="user"

# Create "user" role on local server
vault write auth/oidc/role/user \
        bound_audiences="$AUTH0_CLIENT_ID" \
        allowed_redirect_uris="http://localhost:8200/ui/vault/auth/oidc/oidc/callback" \
        allowed_redirect_uris="http://localhost:8250/oidc/callback" \
        user_claim="sub" \
        policies="user"

