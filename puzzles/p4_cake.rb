# coding : UTF-8
require 'mathn'

# 2個のケーキがありました。
# １：jeremy が好きな大きさに切り
# ２：marry が誰が1個目を選択するかを決めます
# ３：jeremy が好きな大きさに切り
# ４：２で選んでいない人が2個目を選択します

# marryが後に選んだ場合
def marry(f)
  (1-f)+1/2
end

def jeremy(f)
  f+1/2
end

def cake()
  fs=(150..200)
  r = fs.select{|f|
    jeremy(f/360) > marry(f/360)
  }
  d = r.map{|f|
    jeremy(f/360)
  }
  puts r[d.index(d.max())], d.max
end

cake()
