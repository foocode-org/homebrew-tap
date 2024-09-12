class VeracodeCLIAT5112 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.12"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.12_macosx_arm64.tar.gz"
      sha256 "1bc6d12cbc76f3d1511030b8762fd96dfbdc422c69723c9954445e3970347bbf"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.12_macosx_x86.tar.gz"
      sha256 "eec61cef4c8711a46b5b330ed2f64e4b5e1d270718ae178edb193a7019d9177e"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.12_linux_x86.tar.gz"
    sha256 "d1dd8c710c947bfcb13540b5e3835b86b068a0de1f2f77cf600c0fb9c6224924"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
