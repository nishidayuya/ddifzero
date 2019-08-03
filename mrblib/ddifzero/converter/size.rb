class Ddifzero::Converter::Size
  # https://github.com/coreutils/coreutils/blob/v8.31/src/dd.c#L1369
  UNITS = {
    k: 2 ** 10,
    K: 2 ** 10,
    M: 2 ** 20,
    G: 2 ** 30,
    T: 2 ** 40,
    P: 2 ** 50,
    E: 2 ** 60,
    Z: 2 ** 70,
    Y: 2 ** 80,
  }

  def self.call(s)
    n = s.to_i
    n *= UNITS[s[-1].to_sym] || 1 # ugly lax implementation!
    return n
  end
end
