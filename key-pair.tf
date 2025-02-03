# Generate a private key
resource "tls_private_key" "cloud9_key" {
  algorithm = "RSA" # RSA algorithm for key generation
  rsa_bits  = 4096  # 4096-bit key size
}

# Use the private key to create an AWS key pair
resource "aws_key_pair" "cloud9_key" {
  key_name   = "cloud9-key"                                  # Name of the key pair
  public_key = tls_private_key.cloud9_key.public_key_openssh # Get the public key from the private key resource
}

# Optionally store the private key locally for future use
resource "local_file" "private_key" {
  content  = tls_private_key.cloud9_key.private_key_pem # The PEM format of the private key
  filename = "${path.module}/cloud9-key.pem"            # This stores the private key file in the same directory as the Terraform configuration
}
