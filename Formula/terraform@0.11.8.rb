class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  url "https://github.com/robertpeteuil/terraform-installer/archive/v1.3.2.tar.gz"
  version "0.11.8"
  sha256 "ea374dba5eaf4c078f1f1c01fca9dacba3da7f7daf952ceb249c6b6fc50eb92a"

  bottle :unneeded

  def install
    system "./terraform-install.sh", "-c", "-i", "0.11.8"
    bin.install "./terraform"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end