cask "sikarugir" do
  version "1.0.1"
  sha256 "4432471d21f935a1d0f6e0df01e8584e279a7f14ecd4e8b6ab52d41c0aad8122"

  url "https://github.com/Sikarugir-App/Creator/releases/download/v#{version}/Creator-v#{version}.tar.xz"
  name "Sikarugir Creator"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: ">= :catalina"

  app "Sikarugir Creator.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Sikarugir Creator.app"
    system "/usr/bin/codesign", "--force", "--deep", "-s", "-", "#{appdir}/Sikarugir Creator.app"
  end

  zap trash: "~/Library/Application Support/Sikarugir"

  caveats do
    requires_rosetta
  end
end
