class VeracodeCLIAT5111 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.11"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.11_macosx_arm64.tar.gz"
      sha256 "99441d325f3cf45eefb90a5cf1a2a743fee704425e490eae9d50bc1ce030ac6a"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.11_macosx_x86.tar.gz"
      sha256 "556539121375acb3c539503a1ad5f42eb4498016a8f588b4bcaa34b7ce208f9e"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.11_linux_x86.tar.gz"
    sha256 "9b23681c17bffb399a5351fce32037b5cee79715fa162500b4aeeb0067f44b73"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
