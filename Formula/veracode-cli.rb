class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "4.0.8"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.8_macosx_arm64.tar.gz"
      sha256 "aabe4bee9e525e638015b059fabb9b718806055ced978f6fc8503c3b4a5d6d76"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.8_macosx_x86.tar.gz"
      sha256 "e7a7bc7fd35117eeb0c67635bc9e468d8f8bf201c0deab7dea2f028a09cda72b"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.8_linux_x86.tar.gz"
    sha256 "48e7532fe7e36633185fc2f31a1d32faf0a1fed62feb7fa5e32572655a584528"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
