class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  version "0.5.3"
  license "MIT"

  # The release workflow cross-compiles the binaries, uploads them as release
  # assets, and replaces the version/url/sha256 placeholders below. A localports
  # binary links only /usr/lib/libSystem, so there are no runtime dependencies
  # and no build toolchain (zig/LLVM) is installed on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.5.3/localports-aarch64-macos.tar.gz"
      sha256 "dec951c6a8bf1fd8320c5134a57e450ab7ad511e225095f37fb1d4cc8d6617cc"
    end
    on_intel do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.5.3/localports-x86_64-macos.tar.gz"
      sha256 "242d12ccc08a2187db2815ed2c7c3aebc659f262509030bbd3279cc95112c63d"
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