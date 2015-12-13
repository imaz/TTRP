def parse(s)
  raise 'unexpected EOF while reading' if s.empty?

  begin
    eval s.tr('()','[]').gsub(/([\w\d])+/, ':\&,').gsub(']', '],').gsub(/, *(?=$)/, '')
  rescue SyntaxError => e
    raise e.message
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
    assert_raises { parse('') }
  end
end
