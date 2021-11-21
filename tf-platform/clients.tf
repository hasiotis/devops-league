module "alpha" {
  source      = "../modules/aws/platform"
  client_name = "alpha"
}

module "beta" {
  source      = "../modules/do/platform"
  client_name = "beta"
}

module "charlie" {
  source      = "../modules/gcp/platform"
  client_name = "charlie"
}

module "delta" {
  source      = "../modules/linode/platform"
  client_name = "delta"
}
