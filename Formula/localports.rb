class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  # The release workflow copies this formula into the tap and replaces url/sha256.
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "1872431e5cbacd67c0aaa2ffae4ca8162e2291249e6f289de7a61a15a48955a8"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast"
    bin.install "zig-out/bin/localports"
    man1.install "man/localports.1"
    bash_completion.install "completions/localports.bash" => "localports"
    zsh_completion.install "completions/_localports"
    fish_completion.install "completions/localports.fish"
  end

  test do
    system "#{bin}/localports", "--help"
    system "#{bin}/localports", "--version"
  end
end
