class VeracodeCLIAT515 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.5"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.5_macosx_arm64.tar.gz"
      sha256 "feaef39c03f5582e011e7e48487b04f1845270f9aa6a33d06ce9a5b9eeed86c1"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.5_macosx_x86.tar.gz"
      sha256 "6013e75873b5b07e863aceed2b0927fca82bf05fe0d42127ffa222e3bd56d0eb"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.5_linux_x86.tar.gz"
    sha256 "f1cf4e704c0ba3cc9b9f445615a7e974aab09306b40dec3bec3a1a403a0a9ec0"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
