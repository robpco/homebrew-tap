class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  url "https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_darwin_amd64.zip"
  sha256 "98c168b06e8b4058c66e044e3744d49956ce7bc3664dc1679a33f8fffc84564d"
  # url "https://github.com/robertpeteuil/terraform-installer/archive/v1.3.2.tar.gz"
  # sha256 "ea374dba5eaf4c078f1f1c01fca9dacba3da7f7daf952ceb249c6b6fc50eb92a"
  version "0.11.8"

  bottle :unneeded

  def install
    # system "./terraform-install.sh", "-c", "-i", "0.11.8"
    bin.install "./terraform"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end