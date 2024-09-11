class VeracodeCLIAT5110 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.10"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.10_macosx_arm64.tar.gz"
      sha256 "32b21affd0d8a1f5892eedb991825c587b4e5d01747bd11d280b54ad124786ba"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.10_macosx_x86.tar.gz"
      sha256 "93c5c90ed8f8078cca587c079d0a27ca96df3891248a236ad15c5fbe8c2bc737"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.10_linux_x86.tar.gz"
    sha256 "4ca858cb5a40ddd690a4019ab94d4348ac36ca82e3d5eb0b9132f8ffc90275f9"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
