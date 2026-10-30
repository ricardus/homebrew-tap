cask "clipstack" do
  version "1.0.0"
  sha256 "1febb111411d603883f975e0554045c3fbbcfd7d1bc8c47a0bd121c85a1b2cf0"

  url "https://github.com/ricardus/clipstack/releases/download/v#{version}/Clipstack-v#{version}.zip"
  name "Clipstack"
  desc "Local clipboard and screenshot history for the menu bar"
  homepage "https://ricardus.github.io/clipstack/"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

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
