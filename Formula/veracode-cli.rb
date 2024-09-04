class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.3"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.3_macosx_arm64.tar.gz"
      sha256 "1ff936610fac8c7bcabf4cff463412a63350d922b8901f8320b5e680a03387c6"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.3_macosx_x86.tar.gz"
      sha256 "ab164603bd634ddb9d7e4760f2d16705f05ad43124981aabeec9b2d7a683eaa1"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.3_linux_x86.tar.gz"
    sha256 "b817600aaf2a0aeba7e5b6ccaac8220d5d5f9c8bd0121d22a0396ed788f06551"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
