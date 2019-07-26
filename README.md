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
Run the `enable-oidc.sh` script to enable auth and create role, it will ask for Auth0 domain, id and secret.

_You can find id and secret on the Auth0 dashboard in secret-sharing-plateform-POC app or ask Dreamlab_

You can add the env variables manually by executing the following commands:

```
export AUTH0_DOMAIN=zenika.eu.auth0.com
export AUTH0_CLIENT_ID=<insert client id>
export AUTH0_CLIENT_SECRET=<insert client secret>
```

The server should accept your request for authentication via oicd method via CLI or UI

```
vault login -method=oidc
```

or visit http://localhost:8200/ and chose OIDC in Method dropdown menu

## Steps to validate POC

 - [X] Activate OIDC authentication method - see above
 - [X] Create two Users with personal secret store space - see [#1](https://github.com/Zenika/secret-sharing-plateform/issues/1)
 - [ ] Edit a policy to grant access to another user to personal space
 - [ ] Validate the listing of user actions and secrets 

WIP...
