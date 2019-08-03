require "open3"
require "pathname"
require "tempfile"

BIN_PATH = File.join(File.dirname(__FILE__), "../mruby/bin/ddifzero")

def create_tmp_path
  Tempfile.create("ddifzero-test-tmp-") do |f|
    f.close
    tmp_path = Pathname(f.path)
    tmp_path.unlink
    yield(tmp_path)
  end
end

assert("create specified zero file") do
  create_tmp_path do |output_path|
    stdout, stderr, status = *Open3.capture3(BIN_PATH, "count=2", "bs=1k",
                                             "of=#{output_path}")

    assert_equal("", stdout)
    assert_equal(<<EOS, stderr)
2 records out
2048 bytes copied
EOS
    assert_true(status.success?)

    output = output_path.read
    assert_equal("", output.gsub(/\0+/, ""))
    assert_equal(2 * 1024, output.length)
  end
end
