# Written by parallax's release workflow (scripts/homebrew_formula.py).
# Edit the template there, not this file.
class ParallaxCli < Formula
  desc "Manage your Parallax library and Kobo from the terminal"
  homepage "https://parallax.jacksonferguson.me"
  if Hardware::CPU.arm?
    url "https://github.com/JacksonFergusonDev/parallax/releases/download/v0.1.3/parallax-cli-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "05b09599b5c64cba79a725770197f66dee69c800d25dfedb571e1a763c100e15"
  else
    url "https://github.com/JacksonFergusonDev/parallax/releases/download/v0.1.3/parallax-cli-0.1.3-x86_64-apple-darwin.tar.gz"
    sha256 "e426ae276008ed0eabbf3dcc53e76fa4df236779fc49e994b1df75259396ce05"
  end
  version "0.1.3"
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
