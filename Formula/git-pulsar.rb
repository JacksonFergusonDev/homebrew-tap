class GitPulsar < Formula
  include Language::Python::Virtualenv

  desc "Automated paranoid git backup for students"
  homepage "https://github.com/JacksonFergusonDev/git-pulsar"
  url "https://github.com/JacksonFergusonDev/git-pulsar/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "44937cac6cb88373e385909b9c0992eb30d6b4709481d4a570bdf02dcd7581a6"
  license "MIT"

  depends_on "python"

  def install
    # 1. Create a virtualenv
    # 2. Pip install requirements (if any) and the package itself
    # 3. Link the binaries to Homebrew's bin folder
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"git-pulsar-daemon"]
    run_type :interval
    interval 900
    log_path var/"log/git-pulsar.log"
    error_log_path var/"log/git-pulsar.err"
    environment_variables PATH: std_service_path_env
  end

  test do
    system bin/"git-pulsar", "--help"
  end
end