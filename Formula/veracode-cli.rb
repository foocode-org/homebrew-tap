class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "3.4.6"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_3.4.6_macosx_arm64.tar.gz"
      sha256 "610d106180be84c225bb60fb847169d1849407ffaa6bf1daf911ad78c80f2e37"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_3.4.6_macosx_x86.tar.gz"
      sha256 "cfb57621e92551247c2835fad9bc64234b4fea8101af2d222b6e8d60bd10c9fe"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_3.4.6_linux_x86.tar.gz"
    sha256 "fd0020ea2bdef30cf916cb873cf6e283f42cea0543c4cd5852089136b6732135"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
