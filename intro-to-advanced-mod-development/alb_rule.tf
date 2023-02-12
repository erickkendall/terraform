resource "aws_lb_listener_rule" "alb_rule" {
  dynamic "condition" {
    for_each = var.conditions
    content {
      dynamic_host_header {
        for_each = condition.value.field == "host-header" ? [1] : []
        content {
          values = condition.value.values
        }
      }
    }
  }
}
