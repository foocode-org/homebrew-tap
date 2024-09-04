class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.1.2"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.2_macosx_arm64.tar.gz"
      sha256 "d3c240e550952cfd1dfb9b525fa86f95bafceba7116e74132587406edef60125"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.2_macosx_x86.tar.gz"
      sha256 "cb8a4a4cbe99316f475ba6452af98e0363cef4df6140cea880498f6d74787f17"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.1.2_linux_x86.tar.gz"
    sha256 "3628af460d0dfdbcc5cc90f81dd98e04d24de8cf8163f1303fa3ebfd9bc5f946"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
