class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "5.0.7"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.7_macosx_arm64.tar.gz"
      sha256 "d95fd80b19b568fe56771e8e08ce58b6f72621a87d54eccf4cb1447a81901cc8"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.7_macosx_x86.tar.gz"
      sha256 "cd302edbc55b72c7ec7d81079029bc9acb66bf7a60ceea0ab601a975ccfff9e1"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_5.0.7_linux_x86.tar.gz"
    sha256 "2f84bdd46317b7a5ffd82fbd2face6ca8f37b7bf18d3bc5e62158484cf0f7ddf"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end
