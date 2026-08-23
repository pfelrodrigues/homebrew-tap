# Homebrew formula for digitalplus-dl (binary: dp).
#
# Instala o executavel publicado. Codigo-fonte nao e publico.
#
#   brew install pfelrodrigues/tap/digitalplus-dl
#
# Canonical tap: https://github.com/pfelrodrigues/homebrew-tap
class DigitalplusDl < Formula
  desc "Search and download Digital Plus Xtream VOD"
  homepage "https://github.com/pfelrodrigues/homebrew-tap"
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/digitalplus-dl-0.1.0/dp-0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "4e36133a973fab288a11a57dc51881c9dee18f0e7ab345fa8e0def0aab7b8247"
  version "0.1.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dp"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/dp --version")
  end
end
