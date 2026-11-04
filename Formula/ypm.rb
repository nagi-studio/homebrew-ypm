class Ypm < Formula
  desc "Terminal client for Yokaze"
  homepage "https://github.com/nagi-studio/Yokaze"
  # Bump checklist: update both URLs, then refresh each SHA-256 from the
  # matching release artifact. Template lives in the main repo at
  # Formula/ypm.rb.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/nagi-studio/Yokaze/releases/download/v0.14.0/ypm-macos-aarch64",
          using: :nounzip
      sha256 "ced11fbef5f0d68a20c5cc81ac870285180e04a12e1a9485ed1396b3efdb5c26"
    end

    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/nagi-studio/Yokaze/releases/download/v0.14.0/ypm-linux-x64",
          using: :nounzip
      sha256 "76ad51a0090cbf4bc5917d1e6b1471114172afd0f8991d7c9c6488cd4ccd423b"
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
