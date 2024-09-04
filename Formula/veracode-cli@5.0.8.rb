class VeracodeCLIAT508 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.8"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.8_macosx_arm64.tar.gz"
      sha256 "381195b8950564585bacb6e20be588ac397bd0ef44e077a04fbd34c35513b943"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.8_macosx_x86.tar.gz"
      sha256 "9b956056008988331577c8e3a3d5f03413d280b0d49cf02a7de67b7a756d4836"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.8_linux_x86.tar.gz"
    sha256 "c9289683b616f530744f689eca19d76cea62d9a39020918b17140e4042812f1d"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
