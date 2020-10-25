class Sysis < Formula
  depends_on "gawk"

  homepage "https://github.com/robertpeteuil/sysis"
  url "https://github.com/robertpeteuil/sysis/archive/3.7.17.tar.gz"
  sha256 "66312b19d4c24745caa2ff2830d2cecb82d5b834fa4eb3e0b0d7f6bc3f68942a"
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
