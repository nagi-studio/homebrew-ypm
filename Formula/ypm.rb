class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  # Bump checklist: update both URLs, then refresh each SHA-256 from the
  # matching release artifact. Template lives in the main repo at
  # Formula/ypm.rb.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.11.1/ypm-macos-aarch64",
          using: :nounzip
      sha256 "22e92c32fdd256addc81fc6679ba4d0f555832a4c2e32622a00097cad2b7933c"
    end

    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.11.1/ypm-linux-x64",
          using: :nounzip
      sha256 "535ea35eac375e306e96a9dc9ad045e59ffa81ee060c4e00f259efa032073652"
    end

    depends_on "alsa-lib"
    depends_on arch: :x86_64
  end

  def install
    artifact = if OS.mac?
      "ypm-macos-aarch64"
    else
      "ypm-linux-x64"
    end

    bin.install artifact => "ypm"
  end

  test do
    system bin/"ypm", "--version"
  end
end
