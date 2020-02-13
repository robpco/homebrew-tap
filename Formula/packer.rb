class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.0.tar.gz" if OS.linux?
  sha256 "5b160b82d36d8817ce57881569e3e838291595a7c4750effc5ff45cc280a32c6" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.5.2/packer_1.5.2_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "833c05cea07c6af7295ab69c97d2a073a111817ea5db519ad767352449e783dc" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.5.2/packer_1.5.2_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "f614e85723da1ef5c766c1e8624200d008dbfeb72d136d36ac206155480da3b8" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.5.2"

  bottle :unneeded

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.5.2"
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