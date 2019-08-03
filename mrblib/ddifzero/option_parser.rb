class Ddifzero::OptionParser
  def self.define_arg(name, convert: lambda { |s| s })
    attr_reader(name)
    define_method("#{name}=") do |value|
      instance_variable_set("@#{name}", convert.(value))
    end
  end

  def self.define_alias_arg(name, to:)
    define_method("#{name}=") do |value|
      send("#{to}=", value)
    end
  end

  def self.run(argv)
    result = new
    result.run(argv)
    return result
  end

  define_alias_arg :bs, to: :obs
  define_arg :count, convert: Ddifzero::Converter::Integer
  define_arg :obs, convert: Ddifzero::Converter::Size
  define_arg :of

  def initialize
    @count = Float::INFINITY
    @obs = 512
    @of = nil
  end

  def run(argv)
    argv[1 .. -1].each do |arg|
      key, value = *arg.split("=")
      setter_name = "#{key}="
      if !self.respond_to?(setter_name)
        raise ArgumentError, "invalid argument: #{arg.inspect}"
      end
      send(setter_name, value)
    end
  end
end
