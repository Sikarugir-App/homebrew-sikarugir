cask "sikarugir" do
  version "1.0.1"
  sha256 "187825e4e6bf96f294cf9ccb65e53049432b3ee2925480e8ad1cbca12a96e819"

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
