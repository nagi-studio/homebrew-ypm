class Ypm < Formula
  desc "Terminal client for Yokaze"
  homepage "https://github.com/nagi-studio/Yokaze"
  # Bump checklist: update both URLs, then refresh each SHA-256 from the
  # matching release artifact. Template lives in the main repo at
  # Formula/ypm.rb.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/nagi-studio/Yokaze/releases/download/v0.13.0/ypm-macos-aarch64",
          using: :nounzip
      sha256 "6d6e894ff893dc6b8791f1f46e0992124cbbd69cd5417354130857d153a355ff"
    end

    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/nagi-studio/Yokaze/releases/download/v0.13.0/ypm-linux-x64",
          using: :nounzip
      sha256 "62f571de12dc5d74a7e26de84482a3552850a3796e6dda4fc9fa9c7d4702abd7"
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
