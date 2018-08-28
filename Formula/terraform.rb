class Terraform < Formula
  homepage "https://github.com/robertpeteuil/terraform-installer"
  url "https://github.com/robertpeteuil/terraform-installer/archive/v1.3.1.tar.gz"
  version "1.3.1"
  sha256 "5d16e4941c4e3501cb33c75ab98306f5a8432685b86ab1ce8648abd859c2a945"

  bottle :unneeded

  def install
    system "./terraform-install.sh -c"
    bin.install "./terraform"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end