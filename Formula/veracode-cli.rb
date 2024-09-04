class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.1"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.1_macosx_arm64.tar.gz"
      sha256 "b862a5c951c2699e6b5b9645307be43287789cbdc516868313b9e9110558e55e"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.1_macosx_x86.tar.gz"
      sha256 "7644795c625e3f53c3818976ce2a55772a46e51c740240fdc5bde015a59b0cd7"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.1_linux_x86.tar.gz"
    sha256 "31c9d5a0fa2351e87ff1109d16f8e535356e744440043f2a499a49afe6800afe"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
