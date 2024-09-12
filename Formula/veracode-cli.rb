class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.13"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.13_macosx_arm64.tar.gz"
      sha256 "de54f236088691435e4bc63f4db9a8601265c2407df46657217e6559289f1161"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.13_macosx_x86.tar.gz"
      sha256 "ab59abdfc337e0ddcf29a4cb03ca53a9a7bfbca973032b93c1c73064b33c8a76"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.13_linux_x86.tar.gz"
    sha256 "624a1b01d4685041affa66fd2b779b01944365c464b4b5bda32ac11e765de2b9"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
