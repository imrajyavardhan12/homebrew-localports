class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0e09bdcca0f5bdd85a35ebaa96cfd1ff6c4bc71b38b79e52e5e3c96e06dbbd9f"

  depends_on "zig"

  def install
    system "zig", "build", "-Doptimize=ReleaseFast"
    bin.install "zig-out/bin/localports"
  end

  test do
    system "#{bin}/localports", "--help"
  end
end
