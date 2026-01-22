cask "sikarugir" do
  version "1.0.1"
  sha256 "fbc86992107e054cacb0d09e28f6da93648cab3e29f5e46ae2c6d77e0fa62c2e"

  url "https://github.com/Sikarugir-App/Creator/releases/download/v#{version}/Creator-v#{version}.tar.xz"
  name "Sikarugir Creator"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: ">= :catalina"

  app "Sikarugir Creator.app"

  postflight do
    system "/usr/bin/xattr", "-drs", "com.apple.quarantine", "#{appdir}/Sikarugir Creator.app"
    system "/usr/bin/codesign", "--force", "--deep", "-s", "-", "#{appdir}/Sikarugir Creator.app"
    system_command "/bin/mkdir", args: ["-p", "/Users/#{ENV.fetch("USER")}/Applications/Sikarugir"], sudo: false
  end

  zap trash: "~/Library/Application Support/Sikarugir"

  caveats do
    requires_rosetta
  end
end
