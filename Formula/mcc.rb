class Mcc < Formula
  include Language::Python::Virtualenv

  desc "Multi cloud control of VM Instances across AWS, Azure, GCP and AliCloud"
  homepage "https://github.com/robertpeteuil/multi-cloud-control"
  url "https://github.com/robertpeteuil/multi-cloud-control/archive/0.9.8.tar.gz"
  version "0.9.8"
  sha256 "ec1f0293861960814bd5ec99ee1b9df5c0a7685ea5c3c7c5173248a488784b37"

  depends_on "python3"

  bottle do
    root_url "https://iac.sh/brew-bottles"
    cellar :any if OS.mac?
    cellar :any_skip_relocation if OS.linux?
    sha256 "a164b2eff6faa3d70df69bc62b49810ae4b97bb782f91926226715ddecd52ceb" => :sierra
    sha256 "97cf949a15448280e491766d5ced0e5ebee3ec81fa180e8f069b2ded2d752144" => :high_sierra
    sha256 "614cf15cb8fb8daa8ef92e307aeaf1da3b9e8034ca1af688836a0f28c9221c3a" => :x86_64_linux
  end

  resource "apache-libcloud" do
    url "https://files.pythonhosted.org/packages/2a/b9/dbc5ef54d9b5fd5759a483b5cb7404e470ce4dbe7c944416df346cde8ff5/apache-libcloud-2.3.0.tar.gz"
    sha256 "0e2eee3802163bd0605975ed1e284cafc23203919bfa80c0cc5d3cd2543aaf97"
  end

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/51/c7/3af3ec267387d4a900a9e8f9a03a6c9068fb3c606c77bf2dd4558e1ea248/blessed-1.15.0.tar.gz"
    sha256 "777b0b6b5ce51f3832e498c22bc6a093b6b5f99148c7cbf866d26e2dec51ef21"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e1/0f/f8d5e939184547b3bdc6128551b831a62832713aa98c2ccdf8c47ecc7f17/certifi-2018.8.24.tar.gz"
    sha256 "376690d6f16d32f9d1fe8932551d80b23e9d393a8578c5633a2ed39a64861638"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz"
    sha256 "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
  end

  resource "configparser" do
    url "https://files.pythonhosted.org/packages/7c/69/c2ce7e91c89dc073eb1aa74c0621c3eefbffe8216b3f9af9d3885265c01c/configparser-3.5.0.tar.gz"
    sha256 "5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a"
  end

  resource "future" do
    url "https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz"
    sha256 "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
  end

  resource "gevent" do
    url "https://files.pythonhosted.org/packages/49/13/aa4bb3640b5167fe58875d3d7e65390cdb14f9682a41a741a566bb560842/gevent-1.3.6.tar.gz"
    sha256 "7b413c391e8ad6607b7f7540d698a94349abd64e4935184c595f7cdcc69904c6"
  end

  resource "greenlet" do
    url "https://files.pythonhosted.org/packages/5d/82/2e53a8def6f99db51992ca3a0a2448c3bbec1a9db3a7cbf7d5dad011e138/greenlet-0.4.14.tar.gz"
    sha256 "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz"
    sha256 "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"
  end

  resource "PrettyTable" do
    url "https://files.pythonhosted.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2"
    sha256 "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36"
  end

  resource "pycrypto" do
    url "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz"
    sha256 "ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz"
    sha256 "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"
    sha256 "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
  end

  def install
    virtualenv_install_with_resources
  end
 
  test do
    system bin/"mccl"
  end
end