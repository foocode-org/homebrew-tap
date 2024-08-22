#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

index=0
total_len=$(awk 'END { print NR }' ./out/checksums.txt)
while [ $index -le $total_len ]; do
    arc=$(awk "NR==$index {printf \$2 \" \"}" ./out/checksums.txt)
    if [[ $arc == *"linux_x86"* ]]; then
        SHA256_LINUX_x86=$(awk "NR==$index {printf \$1}" ./out/checksums.txt)
    elif [[ $arc == *"macosx_arm64"* ]]; then
        SHA256_MACOS_arm64=$(awk "NR==$index {printf \$1}" ./out/checksums.txt)
    elif [[ $arc == *"macosx_x86"* ]]; then
        SHA256_MACOS_x86=$(awk "NR==$index {printf \$1}" ./out/checksums.txt)
    fi
    ((index++))
done

# Define the heredoc content
read -r -d '' CODE <<EOF

class VeracodeCli < Formula
  desc "Command-line tool for testing application security with Veracode"
  homepage "https://www.veracode.com"
  version "$VERSION"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_macosx_arm64.tar.gz"
      sha256 "$SHA256_MACOS_arm64"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_macosx_x86.tar.gz"
      sha256 "$SHA256_MACOS_x86"
    end
  elsif OS.linux?
    url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_linux_x86.tar.gz"
    sha256 "$SHA256_LINUX_x86"
  end
  def install
    bin.install "veracode"
  end
  test do
    system "#{bin}/veracode", "version"
  end
end

EOF

# Echo the heredoc content
echo "$CODE"
