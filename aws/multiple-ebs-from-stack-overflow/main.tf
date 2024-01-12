data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
variable "ec2_device_names" {
  default = [
    "/dev/sdd",
    "/dev/sde",
    "/dev/sdf"
  ]
}
variable "ec2_ebs_volume_size" {
  default = 10
}
variable "ec2_instance_type" {
  default = "t2.nano"
}
variable "ec2_instance_count" {
  default = 2
}
variable "ec2_ebs_volume_count" {
  default = 3
}
resource "aws_instance" "ec2" {
  count         = var.ec2_instance_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type
}
resource "aws_ebs_volume" "ebs_volume" {
  count             = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  availability_zone = "${element(aws_instance.ec2.*.availability_zone, count.index)}"
  size              = "${var.ec2_ebs_volume_size}"
}

resource "aws_volume_attachment" "volume_attachement" {
  count       = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  volume_id   = "${aws_ebs_volume.ebs_volume.*.id[count.index]}"
  device_name = "${element(var.ec2_device_names, count.index)}"
  instance_id = "${element(aws_instance.ec2.*.id, count.index)}"
}
