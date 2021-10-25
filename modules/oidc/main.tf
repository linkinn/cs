data "tls_certificate" "cluster_certification" {
  url = var.cluster_identity_oidc
}

resource "aws_iam_openid_connect_provider" "main" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cluster_certification.certificates.0.sha1_fingerprint]
  url             = var.cluster_identity_oidc
}
