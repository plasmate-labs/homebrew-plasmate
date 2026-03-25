class Plasmate < Formula
  desc "The browser engine for AI agents - HTML in, Semantic Object Model out"
  homepage "https://plasmate.app"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.4.0/plasmate-aarch64-macos"
      sha256 "de569f39e98e67c73b6a09da78621581e812fed6bcae2ddbd2f979d6b1faee05"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.4.0/plasmate-x86_64-macos"
      sha256 "4cbe4326daa0247f310d03102cc657bab831cfd15179d9f4a1384ab20cb64b7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.4.0/plasmate-aarch64-linux"
      sha256 "7e5cd2cdde69503a32acc099091be9106caf6c5a78508bf64e4ee4c1736fa68e"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.4.0/plasmate-x86_64-linux"
      sha256 "6052f24840c410811346a4e18c91feba7f8817d767dcbe37c49bad6e6557526a"
    end
  end

  def install
    binary = Dir["plasmate*"].first || "plasmate"
    mv binary, "plasmate" unless binary == "plasmate"
    chmod 0755, "plasmate"
    bin.install "plasmate"
  end

  test do
    assert_match "plasmate", shell_output("#{bin}/plasmate --version")
  end
end
