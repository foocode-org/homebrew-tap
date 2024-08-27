class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "4.0.1"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.1_macosx_arm64.tar.gz"
      sha256 "a92c7e68c14c57574671091be6dbac51900d673d10f2721560f26f354a25782b"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.1_macosx_x86.tar.gz"
      sha256 "adabb8a00e59c8f0e0686e9b7b9d0d255f6573f53fdd932102a61e50dd7bbcdc"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.1_linux_x86.tar.gz"
    sha256 "5aa9532d235747f18f8541ce4fa930ff23e699309d32558cd7ae7d240ffceb07"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
