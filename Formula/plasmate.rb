class Plasmate < Formula
  desc "The browser engine for AI agents - HTML in, Semantic Object Model out"
  homepage "https://plasmate.app"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.1/plasmate-aarch64-macos"
      sha256 "4a245e090e79adfcfc21ae13e1161cb6dcdb2a573786139518ec63c5713ea8a4"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.1/plasmate-x86_64-macos"
      sha256 "f8bfd3892f145a0766fded4aff8fc2c728014e14fcc2c1baf3f3e9a574ce2e0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.1/plasmate-aarch64-linux"
      sha256 "79690193fdea17e1a6c173e28333144b6a26147101421bebc5b6be2acc70667c"
    else
      url "https://github.com/plasmate-labs/plasmate/releases/download/v0.5.1/plasmate-x86_64-linux"
      sha256 "4ba2feca669ffec5a895f4fd0fbb505be4d02ac355d9f4e69a3e8716237c61a8"
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
