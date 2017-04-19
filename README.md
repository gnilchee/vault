# Getting Started
#### Initialize Vault
1. `docker exec -it <vault_container> sh`
2. `vault init -address http://127.0.0.1:8200`
   * __IMPORTANT__ Save the unseal keys and initial root token

#### Unseal the vault
1. `curl -X PUT -d '{"key": "unseal_key_1"}' http://vault_url:8200/v1/sys/unseal`
   * Unseal progress 1 of 3
2. `curl -X PUT -d '{"key": "unseal_key_2"}' http://vault_url:8200/v1/sys/unseal`
   * Unseal progress 2 of 3
3. `curl -X PUT -d '{"key": "unseal_key_3"}' http://vault_url:8200/v1/sys/unseal`
   * Unseal progress 3 of 3

#### Placing your first secret
* `curl -s -X PUT -H "X-Vault-Token:<vault_token>" -d '{"value": "world"}' http://vault_url:8200/v1/secret/hello`

#### Getting your first secret
* `curl -s -X GET -H "X-Vault-Token:<vault_token>"  http://vault_url:8200/v1/secret/hello`

#### Next steps
1. Add TLS encryption for Vault: __[Start Here](https://www.vaultproject.io/docs/configuration/listener/tcp.html)__

##### Note: You will need to unseal the Vault after restarts or if you tear down the container.

__WARNING__ Do not remove the persistent data directory created after your first docker-compose up -d. This volume mount persist data for etcd to the host machine. If you remove this after tearing down the container your data will be lost.
