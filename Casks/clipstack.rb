cask "clipstack" do
  version "1.1.0"
  sha256 "945ec4b5d8de618ecc5daa73571fca6ba808231496d471a017a08c0a11eb7ae3"

  url "https://github.com/ricardus/clipstack/releases/download/v#{version}/Clipstack-v#{version}.zip"
  name "Clipstack"
  desc "Local clipboard and screenshot history for the menu bar"
  homepage "https://ricardus.github.io/clipstack/"

  depends_on macos: ">= :sonoma"

  app "Clipstack.app"

  # Not notarized: drop the quarantine flag so Gatekeeper does not block the
  # first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Clipstack.app"]
  end

  uninstall quit: "io.github.ricardus.clipstack"

  zap trash: [
    "~/Library/Application Support/Clipstack",
    "~/Library/Preferences/io.github.ricardus.clipstack.plist",
  ]
end
