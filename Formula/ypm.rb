class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  # Bump checklist: update both URLs, then refresh each SHA-256 from the
  # matching release artifact. Template lives in the main repo at
  # Formula/ypm.rb.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.12.0/ypm-macos-aarch64",
          using: :nounzip
      sha256 "32caeb6a1ec6e07270cceb039e96f92ccbc302fe9955461c3f06245d9b6bab7d"
    end

    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.12.0/ypm-linux-x64",
          using: :nounzip
      sha256 "4fe7ee565a9ae970ab146a430b73b28e364f8dd93b7b2f51d69449d6589944b5"
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
