# put this in /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ops.rb
class OpsRc < Formula
  desc "Lightweight automation for your project"
  homepage "https://github.com/nickthecook/crops"
  url "https://github.com/nickthecook/crops/archive/refs/tags/2.4.0-rc1.tar.gz"
  sha256 "464ed56b7d3c7e3932b75981a9d8d09e9f445ca6deab35f6cb7608175e389c60"
  license "GPL-3.0-only"

  depends_on "crystal" => :build
  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "libyaml"
  depends_on "pcre2"

  def install
    local_crystal_path = `crystal env CRYSTAL_PATH`.chomp
    system("CRYSTAL_PATH='src:lib:#{local_crystal_path}' shards build --release")
    bin.install "bin/ops"
  end

  test do
    system "#{bin}/ops", "version"
  end
end
