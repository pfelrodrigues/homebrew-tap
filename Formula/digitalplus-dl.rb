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
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/digitalplus-dl-0.3.0/dp-0.3.0-aarch64-apple-darwin.tar.gz"
  sha256 "b1a1782651b2d5761b43c30ae5df0d904c67ec28793d31f0db335c98c734ec4c"
  version "0.3.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dp"
    fish_completion.install "dp.fish"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/dp --version")
  end
end
