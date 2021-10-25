# TODO: get thumbprint_id dynamic
resource "aws_iam_openid_connect_provider" "main" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [var.thumbprint_id]
  url             = var.cluster_identity_oidc
}
