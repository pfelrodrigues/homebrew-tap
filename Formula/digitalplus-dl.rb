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
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/digitalplus-dl-0.1.1/dp-0.1.1-aarch64-apple-darwin.tar.gz"
  sha256 "248db40be31c4cd24af0f7cfda7f0ef35b001e69ad38d61362e540cc44409738"
  version "0.1.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dp"
    fish_completion.install "dp.fish"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/dp --version")
  end
end
