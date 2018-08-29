class Terraform < Formula
  homepage "https://github.com/robertpeteuil/tftest"
  url "https://github.com/robertpeteuil/tftest/archive/v1.0.1.tar.gz"
  version "0.11.8"
  sha256 "3b669a0d1c90246f783065e480087634bb7b90758638d70e01a46f5865c9c8f4"

  bottle :unneeded

  def install
    system "./terraform-install.sh", "-c", "-i 0.11.8"
    bin.install "./terraform"
  end

  test do
    output = shell_output("#{bin}/terraform version 2>&1", 1)
    assert_match "Terraform", output
  end

end