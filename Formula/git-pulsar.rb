class GitPulsar < Formula
  include Language::Python::Virtualenv

  desc "Automated paranoid git backup for students"
  homepage "https://github.com/JacksonFergusonDev/git-pulsar"
  url "https://github.com/JacksonFergusonDev/git-pulsar/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "a797061a02be77458e88f3d9a0d4d70270b907a6b3c334fc9dca95dbad1d9fbe"
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