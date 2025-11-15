# put this in /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ops.rb
class Ops < Formula
  desc "Lightweight automation for your project"
  homepage "https://github.com/nickthecook/crops"
  url "https://github.com/nickthecook/crops/archive/refs/tags/2.4.0.tar.gz"
  sha256 "bc20188a8be96feb646c2f699f3313eeb3b93a03664247d75c47398598ea67ef"
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
