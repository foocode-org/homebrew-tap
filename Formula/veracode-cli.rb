class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.9"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.9_macosx_arm64.tar.gz"
      sha256 "23b43852c158c3a4d00d878f18dee13d677d24b69cb8da3ee987d066bc1619d8"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.9_macosx_x86.tar.gz"
      sha256 "53629f0b18d8aba5e5f997d71384d8269f81320c95e07aa4a27f65cae958fc9b"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.9_linux_x86.tar.gz"
    sha256 "d1ef27036588f31cc33015d97ce061ac2bc9c4051995900405e20ad055953fd8"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
