# Companion bridge for the Reframed Chrome extension (Samsung Frame TV).
#
#   brew install --cask pfelrodrigues/tap/reframed-bridge
#
# Official docs: https://www.reframed.gallery/chrome-extension
# The .pkg drops an x86_64 binary at /usr/local/lib/reframed/ReframedBridge
# and registers the Chrome native messaging host. Apple Silicon needs Rosetta.
cask "reframed-bridge" do
  version "1.0.0"
  sha256 "36c4bfbb9f4a56297756cd60f8d664eb5de9c1c70922dcf9851291b22399c860"

  url "https://pub-673dde4b801742e293be307ab76eb45d.r2.dev/downloads/ReframedBridge.pkg"
  name "Reframed Bridge"
  desc "Native messaging bridge to send artwork to Samsung Frame TVs"
  homepage "https://www.reframed.gallery/chrome-extension"

  depends_on macos: :big_sur

  pkg "ReframedBridge.pkg"

  uninstall pkgutil: "com.reframed.bridge",
            delete:  "/usr/local/lib/reframed"

  zap trash: [
    "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.reframed.tv_upload.json",
    "~/Library/Application Support/Microsoft Edge/NativeMessagingHosts/com.reframed.tv_upload.json",
  ]

  caveats do
    requires_rosetta
  end
end
