class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.5.tar.gz" if OS.linux?
  sha256 "d0d648fd4043d43cd70417493e5c766489a297cdbe614160b3a93369280b88e7" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.11.0-alpha/packer_1.11.0-alpha_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "20df3fedaa0fd7ce2af3f6b32019198b84c0d514900a625fa98427206a6b91d7" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.11.0-alpha/packer_1.11.0-alpha_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "bb2c84876664feacb12887e8d2ad8c90e9ce5a669a578b220248cb5dd5934ecc" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.11.0-alpha"

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.11.0-alpha"
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
