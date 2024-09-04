class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.6"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.6_macosx_arm64.tar.gz"
      sha256 "1ecfe22e26a32bd2a349262af48e8b8df9bfd1329a2c4f2b66d6458f8fbc4ad4"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.6_macosx_x86.tar.gz"
      sha256 "2ffbaf50e6fab627bc4d8c1bfa5c545923cd2e6c2d975965f77fb6c679c03d19"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.6_linux_x86.tar.gz"
    sha256 "2a7444d0fc4c2c077109247ea511fb0feba483966f8c9d1f65f7e3fba5498eae"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
