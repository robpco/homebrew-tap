class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  url "https://github.com/robertpeteuil/terraform-installer/archive/v1.5.1.tar.gz" if OS.linux?
  sha256 "a1c32fa96227499d30042a851f34e92e648b8965d600f81a87dc9a5560b01c34" if OS.linux?
  # on macOS - download directly - installer not required as amd_64 is only version available
  url "https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_darwin_amd64.zip" if OS.mac?
  sha256 "829bdba148afbd61eab4aafbc6087838f0333d8876624fe2ebc023920cfc2ad5" if OS.mac?
  version "0.11.14"

  bottle :unneeded

  def install
    if OS.linux?
      system "./terraform-install.sh", "-c", "-i", "0.11.14"
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