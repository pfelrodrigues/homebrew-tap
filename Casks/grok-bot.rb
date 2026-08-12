# Desktop app for Grok Bot (Cursor / SpaceXAI). Apple Silicon only;
# the public download is darwin-arm64. Beta: SuperGrok Heavy, Cursor Ultra
# or Cursor Teams Premium.
#
#   brew install --cask pfelrodrigues/tap/grok-bot
#
# Product: https://x.ai/bot
cask "grok-bot" do
  version "0.16.0"
  sha256 "6dae3cc5259eecd749b28e3622fe9f0333d7aacb32dd71c03dc7fac658617cd4"

  url "https://downloads.cursor.com/sand/stable/darwin-arm64/#{version}/Grok_Bot_#{version}.dmg",
      verified: "downloads.cursor.com/sand/"
  name "Grok Bot"
  desc "Always-on AI teammates with their own computer"
  homepage "https://x.ai/bot"

  livecheck do
    url :homepage
    regex(/Grok_Bot[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  auto_updates true
  depends_on macos: :monterey
  depends_on arch: :arm64

  app "Grok Bot.app"

  uninstall quit: "com.anysphere.sand"

  zap trash: [
    "~/Library/Application Support/com.anysphere.sand",
    "~/Library/Application Support/Grok Bot",
    "~/Library/Caches/com.anysphere.sand",
    "~/Library/Caches/com.anysphere.sand.ShipIt",
    "~/Library/HTTPStorages/com.anysphere.sand",
    "~/Library/Logs/Grok Bot",
    "~/Library/Preferences/com.anysphere.sand.plist",
    "~/Library/Saved Application State/com.anysphere.sand.savedState",
  ]

  caveats <<~EOS
    Grok Bot is in beta. Sign-in needs SuperGrok Heavy, Cursor Ultra,
    or Cursor Teams Premium.
  EOS
end
