resource "tls_private_key" "example_cert" {
  algorithm = "RSA"
}
resource "tls_self_signed_cert" "example" {
  private_key_pem = tls_private_key.example_cert.private_key_pem

  subject {
    common_name  = "example.com"
    organization = "ACME Examples, Inc"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_iam_server_certificate" "test_cert" {
  name             = "some_test_cert"
  certificate_body = tls_self_signed_cert.example.cert_pem
  private_key      = tls_private_key.example_cert.private_key_pem

  provisioner "local-exec" {
    command = "echo '${tls_private_key.example.private_key_pem}' > ./private_key.pem"
  }
  provisioner "local-exec" {
    command = "echo '${aws_iam_server_certificate.test_cert.certificate_body}' > ./cert.pem"
  }
}
