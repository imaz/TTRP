# 架空のコーヒーショップ「スターバッカス」のメニューを生成するプログラムです。 coffee
# 仕様は下記の通りです。（が、実装途中です）

# 温度: ホット or アイス
# ショット: 変更無し or エクストラショット or リストレット
# ミルク: 変更無し or 低脂肪タイプミルク or ノンファット or ソイ
# その他: なし or バニラ(ただし、アイスでは選択不可) or キャラメル

require 'minitest/autorun'

module StarBacchus
  class Menu
    def create(base, options = {})
      @options = options

      if base == :latte && options[:milk] == :soy
        'ソイ スターバッカス ラテ'
      elsif base == :latte && hot? && options[:espresso] == :extrashot
        'エクストラショット スターバッカス ラテ'
      elsif base == :latte && iced? && options[:espresso] == :extrashot
        'アイス エクストラショット スターバッカス ラテ'
      elsif base == :latte && hot?
        'スターバッカス ラテ'
      elsif base == :latte && iced?
        'アイス スターバッカス ラテ'
      end
    end

    def hot?
      @options[:hot]
    end

    def iced?
      @options[:iced]
    end
  end
end

class TestMenu < MiniTest::Unit::TestCase
  def setup
    @menu = StarBacchus::Menu.new
  end

  def test_latte
    assert_equal 'スターバッカス ラテ', @menu.create(:latte, hot: true)
  end

  def test_iced_latte
    assert_equal 'アイス スターバッカス ラテ', @menu.create(:latte, iced: true)
  end

  def test_extrashot
    assert_equal 'エクストラショット スターバッカス ラテ', @menu.create(:latte, hot: true, espresso: :extrashot)
  end

  def test_iced_extrashot
    assert_equal 'アイス エクストラショット スターバッカス ラテ', @menu.create(:latte, iced: true, espresso: :extrashot)
  end

  def test_soy_latte
    assert_equal 'ソイ スターバッカス ラテ', @menu.create(:latte, hot: true, milk: :soy)
  end
end
