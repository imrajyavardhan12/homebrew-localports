class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  version "0.6.1"
  license "MIT"

  # The release workflow cross-compiles the binaries, uploads them as release
  # assets, and replaces the version/url/sha256 placeholders below. A localports
  # binary links only /usr/lib/libSystem, so there are no runtime dependencies
  # and no build toolchain (zig/LLVM) is installed on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.6.1/localports-aarch64-macos.tar.gz"
      sha256 "9ab28eb8a09f5c9625547906fddcc96c4490c1e32411861d5e28691bd3c3954c"
    end
    on_intel do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.6.1/localports-x86_64-macos.tar.gz"
      sha256 "4ff5b1e04a9571d15b11d8d5b3b90afafe1f51b90ade2226eb9132bb3f4351b3"
    end
  end

  def install
    bin.install "localports"
    man1.install "localports.1"
    bash_completion.install "localports.bash" => "localports"
    zsh_completion.install "_localports"
    fish_completion.install "localports.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localports --version")
  end
end