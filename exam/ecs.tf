resource "aws_ecs_cluster" "cluster_1" {
  # count = length(locals.cluster_names)
  for_each = toset(local.cluster_names)
  name = each.key
}
