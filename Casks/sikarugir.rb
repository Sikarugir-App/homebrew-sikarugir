cask "sikarugir" do
  version "2.0.4"
  sha256 "626f9bf9e6c29493906e371a6f1eb72acecb21cef68516890eb98ef59e844160"

  url "https://github.com/Sikarugir-App/Winery/releases/download/v#{version}/winery-v#{version}.tar.xz"
  name "Winery"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: ">= :catalina"

  app "Winery.app", target: "Sikarugir Winery.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Sikarugir Winery.app"
    system "/usr/bin/codesign", "--force", "--deep", "-s", "-", "#{appdir}/Sikarugir Winery.app"
  end

  zap trash: [
    "~/Library/Application Support/Kegworks",
    "~/Library/Caches/com.unofficial.winery",
    "~/Library/Caches/com.unofficial.wineskin",
  ]

  caveats do
    requires_rosetta
  end
end
