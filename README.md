# Secret sharing plateform - POC with Vault

## Description

This is a Proof Of Concept on a secret sharing web app for Zenika collaborator at first and applications technical secrets management in the long run, using Vault as a safe and implementing roles and groups for proper agencies, business domains and sensitive data segregation.


## Objectives

 - User-friendly secret sharing for all collaborators
 - For technical projects (API keys, env. configurations,...) and non-technical people
 - Web UI to share secrets with users and groups
 - Easy access to the personal secrets list
 - Admin panel for logging on user actions and secrets revocation, without secrecy breach

## Steps to run the project:

First, get the relevant package for your architecture and add the binary to your PATH: https://www.vaultproject.io/downloads.html

Verify the install by running the `vault` command, it should display usage

_You can run the_ `vault -autocomplete-install` _and restart your terminal to have autocompletion on commands_

You can then launch the vault server, add the address to your path and check the status:

`vault server -dev` _launched in a separate terminal_

```
export VAULT_ADDR='http://127.0.0.1:8200'
vault status
```

Then write the policies to ensure token creation capabilities:

```
vault policy write admin-policy admin-policy.hcl
vault policy write provisioner-policy provisioner-policy.hcl
vault policy write manager manager.hcl
vault policy write reader reader.hcl
vault policy list
```

You need to add environment variables for Auth0 authentication:

```
export AUTH0_DOMAIN=zenika.eu.auth0.com
export AUTH0_CLIENT_ID=<insert client id>
export AUTH0_CLIENT_SECRET=<insert client secret>
```

_You can find id and secret on the Auth0 dashboard in secret-sharing-plateform-POC app or ask Dreamlab_


## Steps to validate POC

 - [ ] Acitvate OIDC authentication method
 - [ ] Create two Users with personal secret store space
 - [ ] Edit a policy to grant access to another user to personal space
 - [ ] Validate the listing of user actions and secrets 

WIP...
