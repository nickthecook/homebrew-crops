# put this in /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ops.rb
class Ops < Formula
  desc "Lightweight automation for your project"
  homepage "https://github.com/nickthecook/crops"
  url "https://github.com/nickthecook/crops/archive/refs/tags/2.7.0.tar.gz"
  sha256 "ffb22c588ab175dadbcb28f9740248cd361b8f77d6f679c7c7dee8fb8f96f986"
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
    generate_completions_from_executable(bin/"ops", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    system "#{bin}/ops", "version"
  end
end
