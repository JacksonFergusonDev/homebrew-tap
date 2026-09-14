class DarkMatter < Formula
  include Language::Python::Virtualenv

  desc "Dependency-graph-aware storage profiler for Homebrew"
  homepage "https://github.com/jacksonfergusondev/dark-matter"
  url "https://files.pythonhosted.org/packages/92/ca/e164c3358b5eedc9739278dfa699e7070a2820fe17234490f2f82447eb67/dark-matter-0.1.0.tar.gz"
  sha256 "26856964cc2628d023f0106a3667f60d6b54178070920661a452b2561dce5a00"
  license "MIT"

  depends_on "python@3.14"
  depends_on "uv"

  # RESOURCE_BLOCK_START



  # RESOURCE_BLOCK_END

  def install
    # virtualenv_install_with_resources automatically:
    # 1. Creates a venv in libexec
    # 2. Installs all defined 'resource' blocks
    # 3. Installs the main package
    # 4. Links binaries
    virtualenv_install_with_resources using: "python@3.14"
  end

  test do
    # Verify the primary executable
    system bin/"dark-matter", "--help"
  end
end
