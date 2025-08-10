cask "sikarugir" do
  version "1.0"
  sha256 "626f9bf9e6c29493906e371a6f1eb72acecb21cef68516890eb98ef59e844160"

  url "https://github.com/Sikarugir-App/Creator/releases/download/v#{version}/creator-v#{version}.tar.xz"
  name "Sikarugir Creator"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: ">= :catalina"

  app "Creator.app", target: "Sikarugir Creator.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Sikarugir Creator.app"
    system "/usr/bin/codesign", "--force", "--deep", "-s", "-", "#{appdir}/Sikarugir Creator.app"
  end

  zap trash: [
    "~/Library/Application Support/Sikarugir",
  ]

  caveats do
    requires_rosetta
  end
end
