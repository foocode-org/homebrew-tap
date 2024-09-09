class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.8"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.8_macosx_arm64.tar.gz"
      sha256 "f634280453a5d5ba6f4e504ac14be9908156c721fd959b08670d7a208c0e9caa"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.8_macosx_x86.tar.gz"
      sha256 "65fb551b8acf2f5f7ac77ac868ab8f7b595a563de6f71df8d1c7906728336a91"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.8_linux_x86.tar.gz"
    sha256 "8b2813c2f052670d02321459d7068ff406d18539c5576ce32bf8ba11418e3206"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
