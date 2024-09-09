class VeracodeCLIAT516 < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.6"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.6_macosx_arm64.tar.gz"
      sha256 "27cc3e1d66f7b38b74d79a5cd187a4cd39497a076cd1d69692af8d7164cefca5"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.6_macosx_x86.tar.gz"
      sha256 "6460c597f27e722b6c76d476b6bdd43a6d837cbac97be4ca7cec919bac137d1f"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.6_linux_x86.tar.gz"
    sha256 "78029c10ab1f4550d6c75f76930e6847cc8b2b411aef83ebd9a458e4fc502048"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
