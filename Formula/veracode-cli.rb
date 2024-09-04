class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.5"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.5_macosx_arm64.tar.gz"
      sha256 "bc3a7c4a3d06e1d528831be5c6006a347e6432b726fdf3a677e27a0541a93a49"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.5_macosx_x86.tar.gz"
      sha256 "c7f86c06d7749e9e02517ecefe12235d3626f766bc2822eb2dec592e0685fa10"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.5_linux_x86.tar.gz"
    sha256 "962898c524090fee91e4b1235c72b3dd74830dd6c448b84d5c22190f51e446ca"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
