class Sysis < Formula
  depends_on "gawk"

  homepage "https://github.com/robertpeteuil/sysis"
  url "https://github.com/robertpeteuil/sysis/archive/3.7.17.tar.gz"
  sha256 "5d1bcf7a85f36940d2ad598920bf63ce6a36cdf24898b925b6e4b810444fc9b2"
  version "3.7.17"

  head "https://github.com/robertpeteuil/sysis.git"
  
  bottle :unneeded

  def install
    bin.install "./sysis"
  end

  test do
    system bin/"sysis", "-h"
  end

end
