class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.9.1"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.1/ypm-macos-aarch64",
        using: :nounzip
    sha256 "53dc59b28733198a107010c18fb061f588be3261017a8878273c69601d2dc7ff"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.1/ypm-linux-x64",
        using: :nounzip
    sha256 "ddfada2f1147d34c6ddbcfffdcc3287352f8684f881847945c34827810ff4a22"

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
