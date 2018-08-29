class Terraform < Formula
  homepage "https://github.com/robertpeteuil/iac.sh"
  url "https://github.com/robertpeteuil/iac.sh/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "284f20520c072d9cdaf35a81fc177b997d037daa75ffa6f522b92a4faa44ec65"

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