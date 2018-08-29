class Tfdirect < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  url "https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_darwin_amd64.zip"
  sha256 "98c168b06e8b4058c66e044e3744d49956ce7bc3664dc1679a33f8fffc84564d"
  version "0.11.8"

  depends_on :macos

  bottle :unneeded

  def install
    bin.install "./terraform"
  end

  test do
    minimal = testpath/"minimal.tf"
    minimal.write <<~EOS
      variable "aws_region" {
          default = "us-west-2"
      }
      variable "aws_amis" {
          default = {
              eu-west-1 = "ami-b1cf19c6"
              us-east-1 = "ami-de7ab6b6"
              us-west-1 = "ami-3f75767a"
              us-west-2 = "ami-21f78e11"
          }
      }
      # Specify the provider and access details
      provider "aws" {
          access_key = "this_is_a_fake_access"
          secret_key = "this_is_a_fake_secret"
          region = "${var.aws_region}"
      }
      resource "aws_instance" "web" {
        instance_type = "m1.small"
        ami = "${lookup(var.aws_amis, var.aws_region)}"
        count = 4
      }
    EOS
    system "#{bin}/terraform", "init"
    system "#{bin}/terraform", "graph"
  end

end