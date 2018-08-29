class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.3.2.tar.gz"
  version "1.2.5"
  sha256 "4733df392f779c670619700eeb61d951e2f6e5bbbd553638493ff224c2c4bb7e"

  bottle :unneeded

  def install
    system "./packer-install.sh", "-c", "-i", "1.2.5"
    bin.install "./packer"
  end

  test do
    system bin/"packer", "version"
  end

end