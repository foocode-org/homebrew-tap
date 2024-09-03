class VeracodeCLIAT < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "4.0.7"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.7_macosx_arm64.tar.gz"
      sha256 "997d48d2692e0f9b133ec49826c828a2ec0f57b321d761a17d4e4d7bb4180e9d"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.7_macosx_x86.tar.gz"
      sha256 "780bc5837792149e75c400f1f21f0faeb5b79b10e773e1f458967302f3ef5960"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_4.0.7_linux_x86.tar.gz"
    sha256 "673780315bb990da009e775c08d43cce363a746cb8eb01bb0c4f742f117201c2"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
