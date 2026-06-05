class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  # The release workflow copies this formula into the tap and replaces url/sha256.
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8731a1124acb6e8dde3694610d0e59078c4d19cba41d7d6453d11ca0091becd1"

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
