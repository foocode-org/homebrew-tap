class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.0"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.0_macosx_arm64.tar.gz"
      sha256 "108e05f593570d5ed034c16d8dc873a7c3dea78f3e5592deb2658b356e048461"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.0_macosx_x86.tar.gz"
      sha256 "6f769005c1b6d73cb1e7ece5f5ddb02561a0196db96c74ad16432dff95dff5ba"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.0_linux_x86.tar.gz"
    sha256 "e724d854b2137c9fa4c8e2e14395c4f4254a418ea4f866dfd6f713c938a10a93"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
