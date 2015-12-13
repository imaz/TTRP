def parse(s)
  read_from(tokenize(s))
end

def tokenize(s)
  s.gsub('(', ' ( ').gsub(')', ' ) ').split
end

def read_from(tokens)
  raise 'unexpected EOF while reading' if tokens.empty?
  token = tokens.shift
  if '(' == token
    l = []
    l << read_from(tokens) while tokens[0] != ')'
    tokens.shift                # ')' を削除
    l
  else
    token.to_sym
  end
end

require 'minitest/autorun'

class TestParse < Minitest::Test
  def test_parse
    assert_equal(:a, parse('a'))
    assert_equal([:a, :b, :c], parse('(a b c)'))
    assert_equal([:a, :b, [:c]], parse('(a b (c))'))
    assert_equal([:a, [:b, :c, [:d, :e], :f]],
                 parse('(a (b c (d e) f))'))

    assert_raises { parse('(a b') }
  end
end
