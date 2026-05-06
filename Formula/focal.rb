class Focal < Formula
  include Language::Python::Virtualenv

  desc "CLI utilities for AI-assisted development context and workflow automation"
  homepage "https://github.com/jacksonfergusondev/focal"
  url "https://github.com/JacksonFergusonDev/focal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "381fae73942ed16f247ff06756b3ac5897499f6b43cbce5d5f6d88fa02e79401"
  license "MIT"

  depends_on "bat"
  depends_on "fd"
  depends_on "fzf"
  depends_on "gh"
  depends_on "python@3.13"
  depends_on "ripgrep"

  def install
    # 1. Install bash architecture
    prefix.install "bin", "lib", "libexec", "focal"

    # 2. Create the virtual environment natively in libexec
    virtualenv_create(prefix/"libexec", "python3.13")

    # 3. Install shell completions
    bash_completion.install "completions/focal.bash" => "focal"
    zsh_completion.install "completions/_focal"
  end

  test do
    system bin/"focal", "--help"
  end
end
