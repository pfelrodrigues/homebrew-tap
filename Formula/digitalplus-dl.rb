class DigitalplusDl < Formula
  desc "Search and download Digital Plus Xtream VOD"
  homepage "https://github.com/pfelrodrigues/homebrew-tap"
  url "https://github.com/pfelrodrigues/homebrew-tap/releases/download/digitalplus-dl-0.3.1/dp-0.3.1-aarch64-apple-darwin.tar.gz"
  sha256 "97eb718a47f093797b822f3c3a8fc5fb54d68727d23cc7b18402c29d20742d60"
  version "0.3.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dp"
    fish_completion.install "dp.fish"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/dp --version")
  end
end
