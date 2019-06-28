# Read permission on the k/v secrets
path "/secret/*" {
    capabilities = ["read", "list"]
}
# Test id interpolation for personal secret space
path "/secret/{{identity.entity.id}}/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}
