# Grant all permissions on secret
path "/secret/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}
# Test shared secret space
path "/secret/shared/*" {
    capabilities = ["read", "list"]
}
# Test id interpolation for personal secret space
path "/secret/{{identity.entity.id}}/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}
