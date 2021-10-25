output "lb_eks_dns_name" {
  value = aws_lb.lb_eks.dns_name
}

output "lb_eks_zode_id" {
  value = aws_lb.lb_eks.zone_id
}
