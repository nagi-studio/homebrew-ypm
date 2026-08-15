class Ypm < Formula
  desc "Terminal client for YesPlayMusic"
  homepage "https://github.com/nagi-studio/YesPlayMusic"
  license "GPL-3.0-only"

  # Bump checklist: update the version here and in both URLs, then refresh
  # each SHA-256 from the matching release artifact. Template lives in the
  # main repo at Formula/ypm.rb.
  version "0.8.0"

  on_macos do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.8.0/ypm-macos-aarch64",
        using: :nounzip
    sha256 "96a49ec772a98aa373fe8947a2c88183dc72172b5291abe3f2f7bbb3bfaa55b4"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/nagi-studio/YesPlayMusic/releases/download/v0.8.0/ypm-linux-x64",
        using: :nounzip
    sha256 "ec095b09392645a401cc28026176d5a8cb105d62a0f1c6273182edc223687f7f"

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
