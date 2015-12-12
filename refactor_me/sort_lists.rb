def sort_lists(a, b)
  c = [a, b].flatten.sort!

  [c.shift(a.length), c.shift(b.length)]
end

require 'minitest/autorun'

class TestSortLists < Minitest::Test
  def test_sort_lists
    data = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].shuffle
    assert_equal([['a', 'b', 'c', 'd'], ['e', 'f', 'g', 'h']], sort_lists(data[0..3], data[4..7]))
  end

  def test_sort_lists_for_different_size_lists
    data = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].shuffle
    assert_equal([['a', 'b', 'c'], ['d', 'e', 'f', 'g', 'h']], sort_lists(data[0..2], data[3..7]))
  end
end
