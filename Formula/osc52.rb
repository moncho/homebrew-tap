class Osc52 < Formula
  desc "Copy text to the clipboard through the terminal with OSC 52"
  homepage "https://github.com/moncho/osc52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.3.0/osc52-aarch64-apple-darwin"
      sha256 "cd31b79b565106527565beab948953e48e4451ea3d929c74ad6a160c22d16dfb"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.3.0/osc52-x86_64-apple-darwin"
      sha256 "bc49451d91f20f3786653e9072304f6aa250384029718b7d84a4b1f6e9db941f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.3.0/osc52-aarch64-unknown-linux-musl"
      sha256 "2d973e64377f2ef9ac52b777382474260d4a6e7c11cc7ff3ac697086ecc77dc4"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.3.0/osc52-x86_64-unknown-linux-musl"
      sha256 "6e9acc7be0f374ee7cf9269c421210fbf808e747c07b528c43055511029b3fb5"
    end
  end

  def install
    bin.install Dir["osc52-*"].first => "osc52"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osc52 --version")
  end
end
