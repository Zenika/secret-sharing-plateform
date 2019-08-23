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

### Run the server with a storage backend

Alternatively to the dev server (that doesn't save any config or data), you can run the server with a storage backend. The default config provided in `config.hcl`  sets it to a file in the current directory.
There's a few steps you need to follow in order to be able to use the server:
 - run the `vault server -config config.hcl` in a separate terminal to start it
 - run the `vault operator init` to initialize the vault
 - it provides you with keys and a root token, store them in a `unseal_keys` file, in order to log again and unseal after restart
 - run the oidc procedure as described above
 - you can now log with this method or with the root token for admin operations
 - on restart, you need to run the `vault operator unseal` 3 times with diffferent keys to be able to interact with vault


## Steps to validate POC

 - [X] Activate OIDC authentication method - see above
 - [X] Create two Users with personal secret store space - see [#1](https://github.com/Zenika/secret-sharing-plateform/issues/1)
 - [ ] Edit a policy to grant access to another user to personal space
 - [ ] Validate the listing of user actions and secrets 

WIP...
