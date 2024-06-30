#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

# For test version
VERSION="2.26.0"

index=0
total_len=$(awk 'END { print NR }' ./checksum/checksums.txt)
while [ $index -le $total_len ]; do
    arc=$(awk "NR==$index {printf \$2 \" \"}" ./checksum/checksums.txt)
    if [[ $arc == *"linux_x86"* ]]; then
        SHA256_LINUX=$(awk "NR==$index {printf \$1}" ./checksum/checksums.txt)
    elif [[ $arc == *"macosx_arm64"* ]]; then
        SHA256_MACOS=$(awk "NR==$index {printf \$1}" ./checksum/checksums.txt)
    elif [[ $arc == *"macosx_x86"* ]]; then
        SHA256_MACOS_x86=$(awk "NR==$index {printf \$1}" ./checksum/checksums.txt)
    fi
    ((index++))
done

# Define the heredoc content
read -r -d '' CODE <<EOF

class foocodeCli < Formula
  desc "You use the veracode CLI to perform various actions for testing the security of your applications."
  homepage "https://www.veracode.com"
  version "$VERSION"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_macosx_arm64.tar.gz"
      sha256 "$SHA256_MACOS"
    elsif Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_macosx_x86.tar.gz"
      sha256 "$SHA256_MACOS_x86"
    end

    def install
      bin.install "veracode"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_linux_x86.tar.gz"
      sha256 "$SHA256_LINUX"

      def install
        bin.install "veracode"
      end
    fi
    if Hardware::CPU.intel?
      url "https://tools.veracode.com/veracode-cli/veracode-cli_${VERSION}_linux_x86.tar.gz"
      sha256 "$SHA256_LINUX"

      def install
        bin.install "veracode"
      end
    fi
  end

  test do
    system "#{bin}/veracode --version"
  end
end
EOF

# Echo the heredoc content
echo "$CODE"