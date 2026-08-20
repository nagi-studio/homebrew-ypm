class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.9.2"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.2/ypm-macos-aarch64",
        using: :nounzip
    sha256 "d21fc4ba86dc9eaf3daaf55dbc349204938bdc01e3852a42aa1a93688519fcac"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.2/ypm-linux-x64",
        using: :nounzip
    sha256 "e12b1a8dcb32f11e41c1af0c2241b6df62526225014d068433da7a030eec7702"

    depends_on arch: :x86_64
    depends_on "alsa-lib"
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
