class Mimir < Formula
  desc "Local knowledge storage and shared memory for agents"
  homepage "https://github.com/pfelrodrigues/homebrew-tap"
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/mimir-0.1.0/mimir-0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "f21bcb2d0aeb5e58448d6d6e61bf6a1bedf57d4dfaeb8b89a1d55dee2f44dfcb"
  license :cannot_represent

  depends_on macos: :sequoia
  depends_on arch: :arm64

  def install
    bin.install "mimir"
    libexec.install Dir["distribution/*", "distribution/.agents"]
  end

  service do
    run [opt_bin/"mimir", "serve"]
    keep_alive true
    environment_variables HOME: Dir.home
    log_path var/"log/mimir.log"
    error_log_path var/"log/mimir-error.log"
  end

  def caveats
    <<~EOS
      Start the shared local service:
        brew services start pfelrodrigues/tap/mimir
      Connect a local stdio MCP client with:
        /opt/homebrew/bin/mimir mcp
      Optional Codex integration:
        mimir setup codex
      Review any permissions requested by your agent.
      Diagnose the installation:
        mimir doctor
      Data stays in ~/Library/Application Support/Mimir/base after uninstall.
    EOS
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/mimir --version").strip
    assert_match "ready", shell_output("#{bin}/mimir init #{testpath}/base")
  end
end
