require 'rspec'

class Age
  AGE_SPAN = {
    'baby' => 0..2,
    'little child' => 3..6,
    'child' => 7..12,
    'youth' => 13..18,
    'adult' => 19..Float::INFINITY
  }

  def self.span(age)
    raise if age < 0

    AGE_SPAN.find{|k, v| v.include? age }.first
  end
end

describe do
  it 'age がマイナス値の場合、例外を発生させること' do
    expect{Age.span(-1)}.to raise_error
  end

  it do
    (0..2).each do |age|
      expect(Age.span(age)).to eq 'baby'
    end
  end

  it do
    (3..6).each do |age|
      expect(Age.span(age)).to eq 'little child'
    end
  end

  it do
    (7..12).each do |age|
      expect(Age.span(age)).to eq 'child'
    end
  end

  it do
    (13..18).each do |age|
      expect(Age.span(age)).to eq 'youth'
    end
  end

  it '19歳以上の場合、adult を返すこと' do
    expect(Age.span(19)).to eq 'adult'
    expect(Age.span(100)).to eq 'adult'
  end
end
