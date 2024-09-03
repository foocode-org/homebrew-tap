class VeracodeCLIAT409 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "4.0.9"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.9_macosx_arm64.tar.gz"
      sha256 "3ff04077cb6511265cf0cab3032570c98c401ce8fb6b989a60ec78db45b55af1"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.9_macosx_x86.tar.gz"
      sha256 "cc6b18cb558889febe855c444dd63b54c3b7687a7e4fa7c875691b6d8a826a09"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.9_linux_x86.tar.gz"
    sha256 "125089ebb1927e4b10c7ad744b9679e165fcb5be21bb98802a08aab135c814cc"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
