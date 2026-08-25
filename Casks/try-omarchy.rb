cask "try-omarchy" do
  version "0.1.0"
  sha256 "749085c754d3613d236b87ef65ab48df4b2c726096778fc07a345c3c6a81159c"

  url "https://github.com/themartiano/try-omarchy/releases/download/v#{version}/Try.Omarchy.dmg",
      verified: "github.com/themartiano/try-omarchy/"
  name "Try Omarchy"
  desc "Run the Omarchy desktop as a hardware-accelerated app on Apple Silicon"
  homepage "https://github.com/themartiano/try-omarchy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Try Omarchy.app"

  zap trash: [
    "~/Library/Application Support/Try Omarchy",
    "~/Library/Preferences/dev.tryomarchy.native.plist",
    "~/Library/Saved Application State/dev.tryomarchy.native.savedState",
  ]

  caveats <<~EOS
    Persistent VM data lives in ~/Library/Application Support/Try Omarchy.
    Uninstalling the app does not remove it; use `brew uninstall --cask --zap try-omarchy`
    or the in-app reset.
  EOS
end
