resource "aws_lb" "lb_eks" {
  name               = "${var.prefix}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.aws_security_group_id}"]
  subnets            = var.subnet_ids

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "lbtg_eks" {
  name        = "${var.prefix}-terraform-eks-nodes"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "all_eks" {
  load_balancer_arn = aws_lb.lb_eks.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtg_eks.arn
  }
}
