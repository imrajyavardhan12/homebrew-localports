class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  version "0.7.0"
  license "MIT"

  # The release workflow cross-compiles the binaries, uploads them as release
  # assets, and replaces the version/url/sha256 placeholders below. A localports
  # binary links only /usr/lib/libSystem, so there are no runtime dependencies
  # and no build toolchain (zig/LLVM) is installed on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.7.0/localports-aarch64-macos.tar.gz"
      sha256 "e0ef0629bc1cba97cae7dc331a7897a00f1df365231d0fc2508f3f81ae1a13e2"
    end
    on_intel do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.7.0/localports-x86_64-macos.tar.gz"
      sha256 "adc096dbb99e6bc627e7fbe942e48dcd1c6d45d66dfa54052599031ef0673f87"
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