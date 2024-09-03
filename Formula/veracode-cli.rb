class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.0"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.0_macosx_arm64.tar.gz"
      sha256 "0ae518efe30ee61f3d9d560654c2f1867660aff5c35c16ee4c3152d7d592012d"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.0_macosx_x86.tar.gz"
      sha256 "4f8fc170dcbac5495b77c29642a576b766bed54f2c2c56338387e4faf7efde97"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.0_linux_x86.tar.gz"
    sha256 "7ec3460c9e68c76733bdc8ead2d72ce6375c3a1bffb6bd181b946e30c2aad825"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
