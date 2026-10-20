class Osc52 < Formula
  desc "Copy text to the clipboard through the terminal with OSC 52"
  homepage "https://github.com/moncho/osc52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.1.1/osc52-aarch64-apple-darwin"
      sha256 "98c9d263eab2a10b71c716484b9affd78ee73ba9c0bc9369de2a20d32fd90f58"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.1.1/osc52-x86_64-apple-darwin"
      sha256 "b6f06c8a33675555e81c5bc004b89099217042999add62b029618978580aacb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.1.1/osc52-aarch64-unknown-linux-musl"
      sha256 "f4b5f13ca566f93d8eaccc5ce8f553710d95eb87fe44e6ec95ee58f2118c948a"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.1.1/osc52-x86_64-unknown-linux-musl"
      sha256 "4e5c78fbdc6ac95c9f4d8790be3795ff2bada7c92b77a1e009470fc6fb11ebb6"
    end
  end

  def install
    bin.install Dir["osc52-*"].first => "osc52"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osc52 --version")
  end
end
