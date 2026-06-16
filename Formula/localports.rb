class Localports < Formula
  desc "Fast local TCP port inspector for macOS"
  homepage "https://github.com/imrajyavardhan12/LocalPorts"
  version "0.6.0"
  license "MIT"

  # The release workflow cross-compiles the binaries, uploads them as release
  # assets, and replaces the version/url/sha256 placeholders below. A localports
  # binary links only /usr/lib/libSystem, so there are no runtime dependencies
  # and no build toolchain (zig/LLVM) is installed on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.6.0/localports-aarch64-macos.tar.gz"
      sha256 "ffaffa4126a8d1c75322c8cac1a948e1179b67e1f1c0bc53a58c700962a27c97"
    end
    on_intel do
      url "https://github.com/imrajyavardhan12/LocalPorts/releases/download/v0.6.0/localports-x86_64-macos.tar.gz"
      sha256 "26e94b4ba2326c114f114559e61ff586b097e7e45e58b58a76ee1181e14afd85"
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