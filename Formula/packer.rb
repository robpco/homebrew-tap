class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.0.tar.gz" if OS.linux?
  sha256 "5b160b82d36d8817ce57881569e3e838291595a7c4750effc5ff45cc280a32c6" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.4.4/packer_1.4.4_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "584378edfb361f45763c257e480a4b68b38ef4cf9a2154c163d4195539b010f8" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.4.4/packer_1.4.4_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "d57c8ecc3b4356b176e600e4de420fc3feba1ca0d95693dfabb0860145b720b1" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.4.4"

  bottle :unneeded

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.4.4"
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