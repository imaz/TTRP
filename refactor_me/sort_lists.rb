def sort_lists(a, b)
  a.sort!
  b.sort!
  b.size.times do |i|
    a.size.times do |j|
      x, y = a[j], b[i]
      if y < x
        a[j] = y
        b[i] = x
      else
        next
      end
    end
  end
  b.sort!

  [a, b]
end

require 'minitest/autorun'

class TestSortLists < Minitest::Test
  def test_sort_lists
    data = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].shuffle
    assert_equal([['a', 'b', 'c', 'd'], ['e', 'f', 'g', 'h']], sort_lists(data[0..3], data[4..7]))
  end
end
