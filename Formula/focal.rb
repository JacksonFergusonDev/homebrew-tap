class Focal < Formula
  include Language::Python::Virtualenv

  desc "CLI utilities for AI-assisted development context and workflow automation"
  homepage "https://github.com/jacksonfergusondev/focal"
  url "https://github.com/JacksonFergusonDev/focal/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "01fa9d2bf23d7f794bd8f966db3a615aac82bb84945c1901d7c454935b8b4e78"
  license "MIT"

  depends_on "bat"
  depends_on "fd"
  depends_on "fzf"
  depends_on "gh"
  depends_on "python@3.13"
  depends_on "ripgrep"

  # RESOURCE_BLOCK_START
  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21/beautifulsoup4-4.14.3.tar.gz"
    sha256 "6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86"
  end

  resource "markdownify" do
    url "https://files.pythonhosted.org/packages/3f/bc/c8c8eea5335341306b0fa7e1cb33c5e1c8d24ef70ddd684da65f41c49c92/markdownify-1.2.2.tar.gz"
    sha256 "b274f1b5943180b031b699b199cbaeb1e2ac938b75851849a31fd0c3d6603d09"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4/soupsieve-2.8.3.tar.gz"
    sha256 "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end
  # RESOURCE_BLOCK_END

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
