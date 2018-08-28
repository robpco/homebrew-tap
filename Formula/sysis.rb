class Sysis < Formula
  homepage "://github.com/robertpeteuil/sysis"
  url "https://github.com/robertpeteuil/sysis/archive/v3.7.6.tar.gz"
  version "3.7.6"
  sha256 "fb340a136179f975eac8da095862fa2f6e09373f7ded257e4de7e6fc2e21d8dc"

  def install
    if File.file?("#{etc}/sysis") then
      system "rm", "#{etc}/sysis"
    end
    etc.install "sysis"
  end

end