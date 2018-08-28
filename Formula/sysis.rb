class Sysis < Formula
  depends_on "gawk"

  homepage "://github.com/robertpeteuil/sysis"
  url "https://github.com/robertpeteuil/sysis/archive/v3.7.6.tar.gz"
  version "3.7.6"
  sha256 "fb340a136179f975eac8da095862fa2f6e09373f7ded257e4de7e6fc2e21d8dc"

  bottle :unneeded

  def install
    bin.install "sysis"
  end

  test do
    output = shell_output("#{bin}/sysos -h 2>&1", 1)
    assert_match "system", output
  end

end