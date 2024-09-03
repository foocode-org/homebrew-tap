class VeracodeCLIAT4.0.2 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "4.0.2"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.2_macosx_arm64.tar.gz"
      sha256 "80b0dfebe4ecb03dce4b35c20105cdc859a3c8d96a7af16c6fd0812b20b241b0"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.2_macosx_x86.tar.gz"
      sha256 "46953b9bf6149546dd83775c51921128d86e44d7497afb6d5b871e58acb129a0"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.2_linux_x86.tar.gz"
    sha256 "d26d19968cb7330590dd4c8b7c7985bb3aec12ea5b52d32537e783caa38d53cd"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
