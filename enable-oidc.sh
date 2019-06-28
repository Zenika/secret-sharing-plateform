#! /bin/bash

# Enable oidc authentication
vault auth enable oidc

# Configure oidc auth method
vault write auth/oidc/config \
        oidc_discovery_url="https://$AUTH0_DOMAIN/" \
        oidc_client_id="$AUTH0_CLIENT_ID" \
        oidc_client_secret="$AUTH0_CLIENT_SECRET" \
        default_role="reader"

# Create "reader" role on local server
vault write auth/oidc/role/reader \
        bound_audiences="$AUTH0_CLIENT_ID" \
        allowed_redirect_uris="http://localhost:8200/ui/vault/auth/oidc/oidc/callback" \
        allowed_redirect_uris="http://localhost:8250/oidc/callback" \
        user_claim="sub" \
        policies="reader"

