class Osc52 < Formula
  desc "Copy text to the clipboard through the terminal with OSC 52"
  homepage "https://github.com/moncho/osc52"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.2.0/osc52-aarch64-apple-darwin"
      sha256 "654c7cbf51b4c58707c10538d5015e383f60e2be30c70612f0ae56d02b7edd92"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.2.0/osc52-x86_64-apple-darwin"
      sha256 "b758e6936a952782f8e88b1341386b0ba722c625ba6177a42c252d8e78012be5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moncho/osc52/releases/download/v0.2.0/osc52-aarch64-unknown-linux-musl"
      sha256 "2aeee55a0c8cc054d2718f10d9da23a5021b41219f0a13b180e6ff0606b86efb"
    end
    on_intel do
      url "https://github.com/moncho/osc52/releases/download/v0.2.0/osc52-x86_64-unknown-linux-musl"
      sha256 "dc417aa655518d8dd6c298e7a4519d17f375f32fd971a8044a31da6c7183ae98"
    end
  end

  def install
    bin.install Dir["osc52-*"].first => "osc52"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/osc52 --version")
  end
end
