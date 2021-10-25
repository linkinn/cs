# resource "aws_route53_zone" "main" {
#   name = "fillipinascimento.com"
# }

resource "aws_route53_record" "www" {
  zone_id = "Z0116472QTF1JQN6Q5YV"
  name    = "fillipinascimento.com"
  type    = "A"

  alias {
    name                   = var.lb_eks_dns_name
    zone_id                = var.lb_eks_zode_id
    evaluate_target_health = true
  }
}
