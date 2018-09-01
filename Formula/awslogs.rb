class Awslogs < Formula
  include Language::Python::Virtualenv

  desc "AWS CloudWatch logs for Humans"
  homepage "https://github.com/jorgebastida/awslogs"
  url "https://github.com/jorgebastida/awslogs/archive/0.10.tar.gz"
  sha256 "6b05e930ab83d2f7fce4f4aa0320bb855efcd951deb70644a043db539bc56bcf"

  depends_on "python"

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/a5/f1/80a8cf6b72ddf2b45c7c4692233674de0e4de2235f250bc6567a384821b1/boto3-1.8.6.tar.gz"
    sha256 "061595d40ea97e4aae8beb9a2eebfe7b1851f40c3c779529d43ad4f8abe5b3d7"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/b5/7d/a38cc38d5f40d0bb32e1610f29ad3344013cff71d0a6fcc347d5cf9d4f72/botocore-1.11.6.tar.gz"
    sha256 "bd85f6491207b632c76fc6ca3e74b5d75a48c7f06f68ae5e98e794e6be10bc06"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz"
    sha256 "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz"
    sha256 "90dc18e028989c609146e241ea153250be451e05ecc0c2832565231dacdf59c1"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz"
    sha256 "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"
  end

  def install
    # virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system bin/"awslogs"
  end
end