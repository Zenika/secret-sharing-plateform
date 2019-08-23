# Grant all permissions on secret
#path "secret/+/*" {
#  capabilities = ["create", "read", "update", "delete", "list"]
#}
#
path "identity/*" {
  capabilities = ["list", "read"]
}

path "secret/data/{{identity.entity.id}}/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/metadata/{{identity.entity.id}}/*" {
  capabilities = ["list"]
}
# Test shared secret space
path "/secret/shared/*" {
    capabilities = ["read", "list"]
}
