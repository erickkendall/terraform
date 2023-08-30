resource "aws_ebs_volume" "ebs_volume" {
  count             = var.instances_per_subnet * length(module.vpc.private_subnets)
  availability_zone = element(aws_instance.app.*.availability_zone, floor(count.index / var.ebs_volume_count))
  size              = var.ec2_ebs_volume_size[count.index % var.ebs_volume_count]
}
resource "aws_volume_attachment" "volume_attachement" {
  count       = var.instances_per_subnet * length(module.vpc.private_subnets)
  volume_id   = aws_ebs_volume.ebs_volume.*.id[count.index]
  device_name = var.ec2_device_names[count.index % var.ebs_volume_count]
  instance_id = element(aws_instance.app.*.id, floor(count.index / var.ebs_volume_count))
}
