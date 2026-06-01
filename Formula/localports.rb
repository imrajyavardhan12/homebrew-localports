class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  # The release workflow copies this formula into the tap and replaces url/sha256.
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "03f7952ad2a602dba8038dd265ea55782cc20768a26f249fe7acfb62920f45b0"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast"
    bin.install "zig-out/bin/localports"
  end

  test do
    system "#{bin}/localports", "--help"
    system "#{bin}/localports", "--version"
  end
end
