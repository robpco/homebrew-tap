class Terraform < Formula
  homepage "https://github.com/robertpeteuil/tftest"
  url "https://github.com/robertpeteuil/tftest/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "3d66ab5010e6d7a37138c7530770dc0ca5eb4607932073d94c9df429e352c153"

  bottle :unneeded

  def install
    system "./terraform-install.sh", "-c"
    bin.install "./terraform"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end