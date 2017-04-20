# Getting Started
#### Generate self sign cert and keys before bring up Vault/etcd
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout vault.key -out vault.crt`

#### Initialize Vault
1. `curl -s -k -X PUT -d "{\"secret_shares\":5, \"secret_threshold\":3}" https://vault_url:8200/v1/sys/init`
   * __IMPORTANT__ Save the unseal keys and initial root token

#### Unseal the vault
1. `curl -s -k -X PUT -d '{"key": "unseal_key_1"}' https://vault_url:8200/v1/sys/unseal`
   * Unseal progress 1 of 3
2. `curl -s -k -X PUT -d '{"key": "unseal_key_2"}' https://vault_url:8200/v1/sys/unseal`
   * Unseal progress 2 of 3
3. `curl -s -k -X PUT -d '{"key": "unseal_key_3"}' https://vault_url:8200/v1/sys/unseal`
   * Unseal progress 3 of 3

#### Placing your first secret
1. `curl -s  -k -X PUT -H "X-Vault-Token:<vault_token>" -d '{"value": "world"}' https://vault_url:8200/v1/secret/hello`

#### Getting your first secret
1. `curl -s -k -X GET -H "X-Vault-Token:<vault_token>"  https://vault_url:8200/v1/secret/hello`

##### Note: You will need to unseal the Vault after restarts or if you tear down the container.

__WARNING__ Do not remove the persistent data directory created after your first docker-compose up -d. This volume mount persist data for etcd to the host machine. If you remove this after tearing down the container your data will be lost.
