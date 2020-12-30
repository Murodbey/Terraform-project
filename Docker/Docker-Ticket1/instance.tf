resource "aws_instance" "Test" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  vpc_security_group_ids      = ["${aws_security_group.ticket1.id}"]
  key_name                    = "${aws_key_pair.Ticket1.key_name}"
  subnet_id                   = "${var.subnet_id}"
  tags                        = "${var.tags}"
  root_block_device {
      volume_size = "${var.volume_size}"
  }
}
