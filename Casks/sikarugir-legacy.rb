cask "sikarugir-legacy" do
  version "1.0"
  sha256 "f98d737bf4d1b5274e4a74102b8995ab57fcbb408343cb5d631a09cc4d96cb0f"

  url "https://github.com/Sikarugir-App/Creator/releases/download/v#{version}/Creator-v#{version}.tar.xz"
  name "Sikarugir Creator- Legacy"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: ">= :catalina"

  app "Creator.app", target: "Sikarugir Creator - Legacy.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Sikarugir Creator- Legacy.app"
    system "/usr/bin/codesign", "--force", "--deep", "-s", "-", "#{appdir}/Sikarugir Creator- Legacy.app"
    system_command "/bin/mkdir", args: ["-p", "/Users/#{ENV.fetch("USER")}/Applications/Sikarugir"], sudo: false
  end

  zap trash: "~/Library/Application Support/Sikarugir"

  caveats do
    requires_rosetta
  end
end
