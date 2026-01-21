cask "sikarugir" do
  version "1.0.1"
  sha256 "1f867b36f0e3cfd631d9b40a986cf4e3594d47e4555f5a739e6d82de8cce34d1"

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
