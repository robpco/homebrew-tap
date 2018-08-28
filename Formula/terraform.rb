class Terraform < Formula
  homepage "https://github.com/robertpeteuil/terraform-installer"
  url "https://github.com/robertpeteuil/terraform-installer/archive/v1.3.0.tar.gz"
  version "1.3.0"
  sha256 "3c16ddc5c739d60e50c9eae18ceb62bc2627f5ea6cc5c39a3422898947b27799"

  bottle :unneeded

  def install
    system "./terraform-install.sh -a"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end