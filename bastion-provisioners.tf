#create a null resource

resource "null_resource" "copy_ec2_keys" {
  depends_on = [
    module.ec2_public
  ]

  #connection for provisioners to connect to EC2 instance
  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/eks-terraform-key.pem")
  }

  #Defining the File Provisioner : will copy the private ket file to /tmp/ of the instance
  provisioner "file" {
    source = "private-key/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
    
  }

  #Remote Exec Provisioner: using remote exec to modify key permissions for security as required
  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/eks-terraform-key.pem"]
  }

  #Local Exec Provisioner: will run on the local host (computer running terraform) after resources created
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID is: ${module.vpc.vpc_id} >> vpc-creation.txt"
    working_dir = "."
  }
}