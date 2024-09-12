class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.12"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.12_macosx_arm64.tar.gz"
      sha256 "f192ef27103ec1842ec737a1dc0e7398649bf61f6944ad8b48c57fff0e2a0ba1"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.12_macosx_x86.tar.gz"
      sha256 "23fdb1219ce7514fd6d5ac12102befb96f8b4e03711392748532514ac67fe333"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.12_linux_x86.tar.gz"
    sha256 "2fa475c7bd791f0a0f5143c7c9823771095feb40950f0b4de9ece8a5dab0f4dd"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
