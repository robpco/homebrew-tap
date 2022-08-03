class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.5.tar.gz" if OS.linux?
  sha256 "d0d648fd4043d43cd70417493e5c766489a297cdbe614160b3a93369280b88e7" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "8dd3c4a356a666323e47a699d5cee4937aa0b67c0967f223b00ff533135ee92a" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "b5a06ae784895dcf24c64c8a835bf1e8cfb178d0304f55d91c3176cfabe210d9" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.8.3"

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.8.3"
    end
    bin.install "./packer"
  end

  test do
    minimal = testpath/"minimal.json"
    minimal.write <<~EOS
      {
        "builders": [{
          "type": "amazon-ebs",
          "region": "us-east-1",
          "source_ami": "ami-59a4a230",
          "instance_type": "m3.medium",
          "ssh_username": "ubuntu",
          "ami_name": "homebrew packer test  {{timestamp}}"
        }],
        "provisioners": [{
          "type": "shell",
          "inline": [
            "sleep 30",
            "sudo apt-get update"
          ]
        }]
      }
    EOS
    system "#{bin}/packer", "validate", minimal
  end

end
