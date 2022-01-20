class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.5.5.tar.gz" if OS.linux?
  sha256 "d0d648fd4043d43cd70417493e5c766489a297cdbe614160b3a93369280b88e7" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  sha256 "f2763597618eaebe116f954f03de6b422eb7f92f51d0bb3375da584ba008410f" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  sha256 "d7276d02d5ef542f86d4e2ab0c4b3a2333b4f7519b0f48d8092f9a27aef1f459" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.7.9"

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.7.9"
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
