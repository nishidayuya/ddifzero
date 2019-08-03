module Ddifzero
end

module Ddifzero::Converter
end

class Ddifzero::Converter::TestInteger < MTest::Unit::TestCase
  def test_s_call__number
    assert_equal(12, Ddifzero::Converter::Integer.call("12"))
  end
end

class Ddifzero::Converter::TestSize < MTest::Unit::TestCase
  def test_s_call__number
    assert_equal(12, Ddifzero::Converter::Size.call("12"))
  end

  Ddifzero::Converter::Size::UNITS.each do |unit, ratio|
    define_method("test_s_call__number_with_unit_#{unit}") do
      assert_equal(12 * ratio, Ddifzero::Converter::Size.call("12#{unit}"))
    end
  end
end

class Ddifzero::TestOptionParser < MTest::Unit::TestCase
  def test_s_new
    options = Ddifzero::OptionParser.new
    assert_equal(Float::INFINITY, options.count)
    assert_equal(512, options.obs)
    assert_equal(nil, options.of)
  end

  def test_run__bs
    options = Ddifzero::OptionParser.new
    options.run(%w[argv0 bs=1000])
    assert_equal(1000, options.obs)
  end

  [
    [:count, "123", 123],
    [:obs, "2k", 2048],
    [:of, "/path/to/a.bin", "/path/to/a.bin"],
  ].each do |name, arg, parsed|
    define_method("test_run__#{name}") do
      options = Ddifzero::OptionParser.new
      options.run(%W[argv0 #{name}=#{arg}])
      assert_equal(parsed, options.send(name))
    end
  end
end

MTest::Unit.new.run
