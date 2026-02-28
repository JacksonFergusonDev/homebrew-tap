class Protostar < Formula
  include Language::Python::Virtualenv

  desc "High-velocity, deterministic environment scaffolding"
  homepage "https://github.com/jacksonfergusondev/protostar"
  url "https://github.com/JacksonFergusonDev/protostar/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "600ac52fe236edeafdf4535714a85771dbbc876d6134f4649a1756fe087dfa55"
  license "MIT"

  depends_on "python@3.14"

  # Resource: mdurl 0.1.2 (Dependency of markdown-it-py)
  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  # Resource: markdown-it-py 4.0.0 (Dependency of rich)
  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  # Resource: pygments 2.19.2 (Dependency of rich)
  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  # Resource: rich 14.2.0 (Direct dependency)
  resource "rich" do
    url "https://files.pythonhosted.org/packages/fb/d2/8920e102050a0de7bfabeb4c4614a49248cf8d5d7a8d01885fbb24dc767a/rich-14.2.0.tar.gz"
    sha256 "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
  end

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
    system bin/"protostar", "--help"
    # Verify the shorthand alias defined in pyproject.toml
    system bin/"proto", "--help"
  end
end
