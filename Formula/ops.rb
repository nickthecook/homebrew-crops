# put this in /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ops.rb
class Ops < Formula
  desc "Lightweight automation for your project"
  homepage "https://github.com/nickthecook/crops"
  url "https://github.com/nickthecook/crops/archive/refs/tags/2.3.1.tar.gz"
  sha256 "8d1bfee90632c7a52b2b72f0eb3f8abeac94769a55c5b326e5ef27a8a2b59b49"
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
