# Written by ci-cd-release-infrastructure (update-homebrew-binary.yml).
# Do not edit release URLs or checksums by hand.
class Focal < Formula
  desc "Extract token-efficient codebase context, diffs, and CI logs for LLMs"
  homepage "https://github.com/JacksonFergusonDev/focal"
  version "0.5.0"
  license "MIT"

  head do
    url "https://github.com/JacksonFergusonDev/focal.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/JacksonFergusonDev/focal/releases/download/v0.5.0/focal-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "23dd7bffca435e1d155e16fd352cc8720a8a311bad32e6f700b6c8ee2d49b414"
    end
    on_intel do
      url "https://github.com/JacksonFergusonDev/focal/releases/download/v0.5.0/focal-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "48d5902814ea5eded84f5b7200042f2d21de5c680e2108891f1cd2242891da8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JacksonFergusonDev/focal/releases/download/v0.5.0/focal-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e69b8cf199187b681498330aa4ffd0075e928ecb229b74b73656d12f92bb0526"
    end
    on_intel do
      url "https://github.com/JacksonFergusonDev/focal/releases/download/v0.5.0/focal-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f3cc18b4838dc080c7a252137ef82a8c50b8f41479a6901dbce8ce3cfafa494"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "focal"
    end
  end

  test do
    assert_match(/^focal version \d+\.\d+\.\d+/, shell_output("#{bin}/focal --version"))
  end
end
