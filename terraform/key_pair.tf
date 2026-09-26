resource "aws_key_pair" "deployer" {
	key_name = "cloud-ha-infra-key"
	public_key = file("/home/tamas/.ssh/aws-ec2-key.pub")
}
