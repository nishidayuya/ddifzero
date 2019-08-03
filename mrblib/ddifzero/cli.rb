class Ddifzero::Cli
  def self.run(argv)
    new(argv).run
  end

  def initialize(argv)
    @options = Ddifzero::OptionParser.run(argv)
  end

  private

  def open_file
    f = STDOUT
    if @options.of
      f = File.open(@options.of, "w")
    end
    yield(f)
  ensure
    f.close
  end

  def run
    copied_bytes = 0
    current_count = 0
    b = "\0" * @options.obs
    open_file do |f|
      f.sync = true
      while current_count < @options.count
        copied_bytes += f.write(b)
        current_count += 1
      end
    end
  rescue IOError
  ensure
    STDERR.puts(<<EOS)
#{current_count} records out
#{copied_bytes} bytes copied
EOS
  end
end
