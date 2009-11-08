def c(r,g,b)
  puts "#{r} #{g} #{b}"
  16 + (6 * (r / 256.0)).to_i * 36 + (6 * (g / 256.0)).to_i * 6 + (6 * (b / 256.0)).to_i
end

def chex(color)
  r = color[0..1].to_i(16)
  g = color[2..3].to_i(16)
  b = color[4..5].to_i(16)
  c(r, g, b)
end

