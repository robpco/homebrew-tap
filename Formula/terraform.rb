class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  url "https://github.com/robertpeteuil/terraform-installer/archive/v1.5.1.tar.gz" if OS.linux?
  sha256 "a1c32fa96227499d30042a851f34e92e648b8965d600f81a87dc9a5560b01c34" if OS.linux?
  # on macOS - download directly - installer not required as amd_64 is only version available
  url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_darwin_amd64.zip" if OS.mac?
  sha256 "3a97f2fffb75ac47a320d1595e20947afc8324571a784f1bd50bd91e26d5648c" if OS.mac?
  version "1.0.6"

  bottle :unneeded

  def install
    if OS.linux?
      system "./terraform-install.sh", "-c", "-i", "1.0.6"
    end
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