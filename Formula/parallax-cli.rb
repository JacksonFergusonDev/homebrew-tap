# Written by parallax's release workflow (scripts/homebrew_formula.py).
# Edit the template there, not this file.
class ParallaxCli < Formula
  desc "Manage your Parallax library and Kobo from the terminal"
  homepage "https://parallax.jacksonferguson.me"
  if Hardware::CPU.arm?
    url "https://github.com/JacksonFergusonDev/parallax/releases/download/v0.1.0/parallax-cli-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "3293930170aae88d82bb92c5f6c8382c915cfe3ce9220f7bc8c689a6fe9ebe9a"
  else
    url "https://github.com/JacksonFergusonDev/parallax/releases/download/v0.1.0/parallax-cli-0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "e58ee13e492b147cdb36c2fec807b8483441449ad04d54f005c78a1e263148f0"
  end
  version "0.1.0"
  license "GPL-3.0-only"

  head do
    url "https://github.com/JacksonFergusonDev/parallax.git", branch: "main"

    depends_on "rust" => :build
    depends_on "kepubify"
  end

  depends_on :macos

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(root: libexec, path: "crates/cli")
      kepubify = formula_opt_bin("kepubify")/"kepubify"
      (bin/"parallax-cli").write_env_script libexec/"bin/parallax-cli", PARALLAX_KEPUBIFY: kepubify
    else
      libexec.install "parallax-cli", "kepubify"
      (bin/"parallax-cli").write_env_script libexec/"parallax-cli", PARALLAX_KEPUBIFY: libexec/"kepubify"
    end
  end

  test do
    assert_match(/^parallax-cli \d+\.\d+\.\d+/, shell_output("#{bin}/parallax-cli --version"))
  end
end
