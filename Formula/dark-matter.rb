# Written by ci-cd-release-infrastructure (update-homebrew-binary.yml).
# Do not edit release URLs or checksums by hand.
class DarkMatter < Formula
  desc "Dependency-graph-aware storage profiler for Homebrew"
  homepage "https://github.com/JacksonFergusonDev/dark-matter"
  version "0.2.2"
  license "MIT"

  head do
    url "https://github.com/JacksonFergusonDev/dark-matter.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/JacksonFergusonDev/dark-matter/releases/download/v0.2.2/dark-matter-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "b9c58d973c6eac5de84470fda1a700321f60e4d15189b568ae2dfac0d35a495e"
    end
    on_intel do
      url "https://github.com/JacksonFergusonDev/dark-matter/releases/download/v0.2.2/dark-matter-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "cb46f54a9d51972f4efe41caa168db17fdf8992656267e2eaa914611ef5c13c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JacksonFergusonDev/dark-matter/releases/download/v0.2.2/dark-matter-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c646bb2ddad3d0697535a83f74aace6bd08040ad3443d8b0e216d75e138a34db"
    end
    on_intel do
      url "https://github.com/JacksonFergusonDev/dark-matter/releases/download/v0.2.2/dark-matter-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "012699d0b8ad876cedd63aec3eb621417806d4f0ba2fee7fb07ffeb98230e50f"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "dark-matter"
    end
  end

  test do
    assert_match(/^dark-matter version \d+\.\d+\.\d+/, shell_output("#{bin}/dark-matter --version"))
  end
end
