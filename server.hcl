storage "etcd" {
  address  = "http://etcd:2379"
  etcd_api = "v3"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_min_version = "tls12"
  tls_cert_file = "/vault/config/ssl/vault.crt"
  tls_key_file  = "/vault/config/ssl/vault.key"
}

disable_mlock = true
