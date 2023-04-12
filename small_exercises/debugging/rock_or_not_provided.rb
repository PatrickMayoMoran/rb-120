# ISSUES
## Misuse of ZeroDivision Error
# -- Currently, a ZeroDivisionError would never happen since we are dividing
# -- by float zeros, which would produce NaN
## Why are we multiplying by 100?
# -- This limits our output to always being greater than 1; we therefore never
# -- see any of the other output
class AuthenticationError < StandardError; end

# A fake search engine
# code omitted

module DoesItRock
  API_KEY = 'wrong key'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end
