class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/robertpeteuil/packer-installer/archive/v1.3.3.tar.gz" if OS.linux?
  sha256 "139c53661dcab6dd2452f6e03e6a9a30ad66665ce78260e0ab84c7cd29df1738" if OS.linux?
  # on macOS - download 32_bit version directly
  url "https://releases.hashicorp.com/packer/1.3.0/packer_1.3.0_darwin_386.zip" if (OS.mac? && Hardware::CPU.is_32_bit?)
  url "fae66e78ca44e04a21a4cb6784632d74106f24927d110ca165a2fe56b8d5c048" if (OS.mac? && Hardware::CPU.is_32_bit?)
  # on macOS - download 64_bit version directly
  url "https://releases.hashicorp.com/packer/1.3.0/packer_1.3.0_darwin_amd64.zip" if (OS.mac? && Hardware::CPU.is_64_bit?)
  url "972af633f1d06bfc36e1c932a125396ade4795980a02eaec4c6792763da6de95" if (OS.mac? && Hardware::CPU.is_64_bit?)
  version "1.3.0"

  bottle :unneeded

  def install
    if OS.linux?
      system "./packer-install.sh", "-c", "-i", "1.3.0"
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