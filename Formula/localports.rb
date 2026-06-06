class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  # The release workflow copies this formula into the tap and replaces url/sha256.
  url "https://github.com/imrajyavardhan12/LocalPorts/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "6a4523f77b809ec9e7327530fb401839ca7dd3b9d489b677bf7dfe9ce7177777"

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
