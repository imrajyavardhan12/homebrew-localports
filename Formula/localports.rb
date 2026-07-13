class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  license "MIT"

  # The release workflow cross-compiles the binaries, uploads them as release
  # assets, and replaces the version/url/sha256 placeholders below. A localports
  # binary links only /usr/lib/libSystem, so there are no runtime dependencies
  # and no build toolchain (zig/LLVM) is installed on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.8.0/localports-aarch64-macos.tar.gz"
      sha256 "eb86233c95a83d1c98d9639e6123150a2f0a3c700d52b76a7ad47ec8ca103f60"
    end
    on_intel do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.8.0/localports-x86_64-macos.tar.gz"
      sha256 "23cda8647ec3b75cd26213830adc1e11cb607c02cbf99ca57bd2a90854e18f19"
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
