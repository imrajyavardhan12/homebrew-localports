class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  # The release workflow copies this formula into the tap and replaces url/sha256.
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9c74c6bb683ff96c6b5f9221682e92602fc8e31fe951eb2c91ea48575da3a049"

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
