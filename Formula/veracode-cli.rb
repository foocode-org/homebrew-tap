class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.1"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.1_macosx_arm64.tar.gz"
      sha256 "83715463f79c0e8c93423143c207c8239b0784ea64a5babea7f7f31041fb415c"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.1_macosx_x86.tar.gz"
      sha256 "e38aed8e9d28527db1f94f7590870ab880135660fc99b9708be82eb239b39338"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.1_linux_x86.tar.gz"
    sha256 "37957af6e6f49a4f0044d49e6c256cc11e2a2bdeadf70a442c7d10b77a210c00"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
