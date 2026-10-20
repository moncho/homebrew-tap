#!/bin/sh
# Regenerate Formula/osc52.rb from the latest moncho/osc52 release.
set -eu

repo=moncho/osc52
tag=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')
base="https://github.com/$repo/releases/download/$tag"

sha() {
  sum=$(curl -fsSL "$base/osc52-$1.sha256")
  echo "${sum%% *}"
}

mac_arm=$(sha aarch64-apple-darwin)
mac_intel=$(sha x86_64-apple-darwin)
linux_arm=$(sha aarch64-unknown-linux-musl)
linux_intel=$(sha x86_64-unknown-linux-musl)
for v in "$tag" "$mac_arm" "$mac_intel" "$linux_arm" "$linux_intel"; do
  [ -n "$v" ] || { echo "update-osc52: missing release data" >&2; exit 1; }
done

cat >Formula/osc52.rb <<EOF
class Osc52 < Formula
  desc "Copy text to the clipboard through the terminal with OSC 52"
  homepage "https://github.com/$repo"
  license "MIT"

  on_macos do
    on_arm do
      url "$base/osc52-aarch64-apple-darwin"
      sha256 "$mac_arm"
    end
    on_intel do
      url "$base/osc52-x86_64-apple-darwin"
      sha256 "$mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$base/osc52-aarch64-unknown-linux-musl"
      sha256 "$linux_arm"
    end
    on_intel do
      url "$base/osc52-x86_64-unknown-linux-musl"
      sha256 "$linux_intel"
    end
  end

  def install
    bin.install Dir["osc52-*"].first => "osc52"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osc52 --version")
  end
end
EOF
