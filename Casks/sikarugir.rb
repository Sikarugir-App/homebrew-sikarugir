cask "sikarugir" do
  version "1.0.2"
  sha256 "e7852e78a02b6958708563e87aedf55986cbf6a7e6d6bcb3d661d8fccb15b7bd"

  url "https://github.com/Sikarugir-App/Creator/releases/download/v#{version}/Creator-v#{version}.tar.xz"
  name "Sikarugir Creator"
  desc "Porting tool, to make Windows programs/games into native apps"
  homepage "https://github.com/Sikarugir-App"

  depends_on macos: :sonoma

  app "Sikarugir Creator.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{appdir}}/Sikarugir Creator.app"]
    run "/usr/bin/codesign", args: ["--force", "--deep", "-s", "-", "{{appdir}}/Sikarugir Creator.app"]
    mkdir_p "/Users/{{user}}/Applications/Sikarugir"
  end

  zap trash: "~/Library/Application Support/Sikarugir"

  caveats do
    requires_rosetta
    <<~EOS
      If you found this software via https:\\sikarugir.com scan your system for malware
      That site is not owned, ran nor affiliated with this project!
    EOS
  end
end
