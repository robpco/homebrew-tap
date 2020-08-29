class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.0.tar.gz" if OS.linux?
  sha256 "22ef75c1f5a8878acb9aed4cb4ba71a147fc4f6be4110577e0a457e359af04ea" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "ef4ee861b812e4d65124e0cccd9d831b55484a2131e7739e1657fad931bb20a9" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "2b5e8c76ae280c72fe33b2ac6511c24d2e0c02df9d437d2e4a5efbe988f71e2b" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.6.2"

  bottle :unneeded

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.6.2"
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
