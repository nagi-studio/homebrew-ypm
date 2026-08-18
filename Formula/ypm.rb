class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.9.0"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.0/ypm-macos-aarch64",
        using: :nounzip
    sha256 "443b6c31dd2fecd673bb6fab7bb11d8717f38ea3ac6ad4d232c93db9acfbcd28"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.0/ypm-linux-x64",
        using: :nounzip
    sha256 "c3b06c2773a5aa726db1ca6e2e9e85731626ae838ab5e2fe9f9b743f897094ce"

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
