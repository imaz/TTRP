class SushisController
  def neta_list
    @neta_list ||= params[:sushi][:neta].split(/[\s[[:blank:]]]+/)
  end

  def params
    { sushi: { neta: 'アナゴ 赤貝　コハダ' }}
  end
end

require 'minitest/autorun'

class TestSushisController < MiniTest::Test
  def setup
    @sushi_controller = SushisController.new
  end

  def test_neta_list
    assert_equal ['アナゴ', '赤貝', 'コハダ'], @sushi_controller.neta_list
  end
end
