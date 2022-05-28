class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.5.tar.gz" if OS.linux?
  sha256 "d0d648fd4043d43cd70417493e5c766489a297cdbe614160b3a93369280b88e7" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "ce9edc023bf8f0557509432b957390820048886f82961648b7a25852b2a0f6a6" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "50220d41af4aaa65e5107fde92007d24572053949f830dfe3010eafc95017db7" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.8.1"

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.8.1"
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
