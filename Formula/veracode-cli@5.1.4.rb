class VeracodeCLIAT514 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.4"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.4_macosx_arm64.tar.gz"
      sha256 "8942ef90bd8bdb7b2afe29bfd76539cf3220d3d52070d2b17d5f203db1d91ee4"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.4_macosx_x86.tar.gz"
      sha256 "bbc348f1d17dfdedc3b9ecd2cd4989c7f4edbe91e9bad9a9dd1ffb9f6794bd97"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.4_linux_x86.tar.gz"
    sha256 "3d7987c61edf83678ed80ce42b5513f733ba7d930a8f6c0af17c79613075e0f5"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
