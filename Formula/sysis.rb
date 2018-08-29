class Sysis < Formula
  depends_on "gawk"

  homepage "https://github.com/robertpeteuil/sysis"
  url "https://github.com/robertpeteuil/sysis/archive/v3.7.6.tar.gz"
  sha256 "fb340a136179f975eac8da095862fa2f6e09373f7ded257e4de7e6fc2e21d8dc"
  version "3.7.6"

  head "https://github.com/robertpeteuil/sysis.git"
  
  bottle :unneeded

  def install
    bin.install "./sysis"
  end

  test do
    system bin/"sysis", "-h"
  end

end