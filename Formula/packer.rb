class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.0.tar.gz" if OS.linux?
  sha256 "22ef75c1f5a8878acb9aed4cb4ba71a147fc4f6be4110577e0a457e359af04ea" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "65f5b6c9fda14bdeecee1379f140ddc6e02294ee84bc8f6284fa55a433034e7f" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "df4fce2ee7bfc7dbb636d9dc6c7fa1c998e3a526dd6c804998e86a2ee30c800f" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.7.1"

  bottle :unneeded

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.7.1"
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
