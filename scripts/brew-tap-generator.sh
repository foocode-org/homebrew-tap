#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

index=0
total_len=$(awk 'END { print NR }' ./checksums.txt)
while [ $index -le $total_len ]; do
    arc=$(awk "NR==$index {printf \$2 \" \"}" ./checksums.txt)
    if [[ $arc == *"linux_x86"* ]]; then
        SHA256_LINUX=$(awk "NR==$index {printf \$1}" ./checksums.txt)
    elif [[ $arc == *"macosx_arm64"* ]]; then
        SHA256_MACOS=$(awk "NR==$index {printf \$1}" ./checksums.txt)
    elif [[ $arc == *"macosx_x86"* ]]; then
        SHA256_MACOS_x86=$(awk "NR==$index {printf \$1}" ./checksums.txt)
    fi
    ((index++))
done

# Define the heredoc content
read -r -d '' CODE <<EOF

class helloworldCli < Formula
  desc "You use the helloworld CLI to perform various actions for testing the security of your applications."
  homepage "https://www.helloworld.com"
  version "$VERSION"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://tools.helloworld.com/helloworld-cli/helloworld-cli_${VERSION}_macosx_arm64.tar.gz"
      sha256 "$SHA256_MACOS"
    elsif Hardware::CPU.intel?
      url "https://tools.helloworld.com/helloworld-cli/helloworld-cli_${VERSION}_macosx_x86.tar.gz"
      sha256 "$SHA256_MACOS_x86"
    end

    def install
      bin.install "helloworld"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://tools.helloworld.com/helloworld-cli/helloworld-cli_${VERSION}_linux_x86.tar.gz"
      sha256 "$SHA256_LINUX"

      def install
        bin.install "helloworld"
      end
    fi
    if Hardware::CPU.intel?
      url "https://tools.helloworld.com/helloworld-cli/helloworld-cli_${VERSION}_linux_x86.tar.gz"
      sha256 "$SHA256_LINUX"

      def install
        bin.install "helloworld"
      end
    fi
  end

  test do
    system "#{bin}/helloworld --version"
  end
end
EOF

# Echo the heredoc content
echo "$CODE"