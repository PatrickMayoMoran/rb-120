# begin
#   1 + 'z'
# rescue TypeError => e
#   puts e
#   puts e.message
# end

class MeowError < StandardError ;end

def cat?(obj)
  raise MeowError, "Not a cat!" unless obj == "cat"
end

begin
  cat?('dog')
rescue MeowError => e
  puts e
  puts "Try again"
end
