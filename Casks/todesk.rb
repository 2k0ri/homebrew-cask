cask "todesk" do
  version "4.3.1.0"
  sha256 "2ed0a1e07b3c70060f2cfe11a265795ef41ea2912f40d5bc3d66481537587f86"

  url "https://dl.todesk.com/macos/ToDesk_#{version}.pkg"
  name "ToDesk"
  desc "Remote control software"
  homepage "https://www.todesk.com/"

  livecheck do
    url "https://dl.todesk.com/macos/uplog.html"
    regex(%r{<div\sclass="text">(\d+(?:\.\d+)+)</div>}i)
  end

  auto_updates true

  pkg "ToDesk_#{version}.pkg"

  uninstall delete:    "/Applications/ToDesk.app",
            launchctl: [
              "com.youqu.todesk.desktop",
              "com.youqu.todesk.service",
              "com.youqu.todesk.startup",
              "com.youqu.todesk.client.startup",
            ],
            pkgutil:   "com.youqu.todesk.mac",
            quit:      "com.youqu.todesk.mac"

  zap trash: [
    "~/Library/Application Scripts/com.youqu.todesk.mac.LaunchHelper",
    "~/Library/Containers/com.youqu.todesk.mac.LaunchHelper",
    "~/Library/Group Containers/group.youqu.todesk",
    "~/Library/Preferences/com.youqu.todesk.mac.plist",
    "~/Library/ToDesk",
  ]
end
