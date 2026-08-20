class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.9.3"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.3/ypm-macos-aarch64",
        using: :nounzip
    sha256 "feeba94948347afa559b3158e427fefd7177c9a4f23264b082ea43a8c7f2c197"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.9.3/ypm-linux-x64",
        using: :nounzip
    sha256 "94a4ce294cfbd79117a4d4d8da5c175ffeb5acd144996a589ccfe840c3335c4e"

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
