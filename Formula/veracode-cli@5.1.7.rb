class VeracodeCLIAT517 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.7"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.7_macosx_arm64.tar.gz"
      sha256 "2001148f8f02bf3d0f8fe1ea798d25c52ec53b03e896ba02973bfccc990056ad"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.7_macosx_x86.tar.gz"
      sha256 "7da2a1dcd9bf009bb7ed40f5002a8257f2562f3f956f21d126684c809545cba9"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.7_linux_x86.tar.gz"
    sha256 "3a12fd4560c8697aa22b28185d1c60383aaf856f4c26ffc841fe71be5c9b3bbc"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
