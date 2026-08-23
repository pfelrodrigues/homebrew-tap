# Homebrew formula for digitalplus-dl (binary: dp).
#
# Instala o executavel publicado e o completion fish. Codigo-fonte nao e publico.
#
#   brew install pfelrodrigues/tap/digitalplus-dl
#
# Canonical tap: https://github.com/pfelrodrigues/homebrew-tap
class DigitalplusDl < Formula
  desc "Search and download Digital Plus Xtream VOD"
  homepage "https://github.com/pfelrodrigues/homebrew-tap"
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/digitalplus-dl-0.1.2/dp-0.1.2-aarch64-apple-darwin.tar.gz"
  sha256 "6b79f9bf17812886d7a0e26dfd005f550a77c2a99e8fad7ac3505654bd966168"
  version "0.1.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dp"
    fish_completion.install "dp.fish"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/dp --version")
  end
end
