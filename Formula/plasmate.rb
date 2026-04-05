class Plasmate < Formula
  desc "The browser engine for AI agents - HTML in, Semantic Object Model out"
  homepage "https://plasmate.app"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.0/plasmate-aarch64-macos"
      sha256 "78c24dcdf24b73815d61ef3d54e94648ba5907b63cab3d4fe7874ea72117211d"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.0/plasmate-x86_64-macos"
      sha256 "d29b15f1e38f1914c4eeb63b994ed75f8b46de541fd637063fce0e17c9274ce3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.0/plasmate-aarch64-linux"
      sha256 "888ef0103954e09c0c805d6e2669bc12726f4e5043cdac54940a0bf64f461dc1"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.0/plasmate-x86_64-linux"
      sha256 "197a9eeaa277641fe548eb43e50fceee2335a840ba1a3786332d2fa92b1d506b"
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
