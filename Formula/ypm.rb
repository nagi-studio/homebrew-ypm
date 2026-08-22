class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.10.0"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.10.0/ypm-macos-aarch64",
        using: :nounzip
    sha256 "9ef6a5b22f8cfd4847d6120fc3c1a5343a26ba39de788f307f3ae2742982b0cd"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.10.0/ypm-linux-x64",
        using: :nounzip
    sha256 "53e0c1b832768f42532ab77c7c45fc0d09e5faadb9f3dc76b7986378e72bbd05"

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
