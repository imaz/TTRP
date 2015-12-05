require 'rspec'

def age_span(age)
  0 <= age or raise

  if 0 <= age && age <= 2
      'baby'
  elsif 3 <= age && age <= 6
      'little child'
  elsif 7 <= age && age <= 12
      'child'
  elsif 13 <= age && age <= 18
      'youth'
  else
      'adult'
  end
end

describe do
  it 'age がマイナス値の場合、例外を発生させること' do
    expect{age_span(-1)}.to raise_error
  end

  it do
    (0..2).each do |age|
      expect(age_span(age)).to eq 'baby'
    end
  end

  it do
    (3..6).each do |age|
      expect(age_span(age)).to eq 'little child'
    end
  end

  it do
    (7..12).each do |age|
      expect(age_span(age)).to eq 'child'
    end
  end

  it do
    (13..18).each do |age|
      expect(age_span(age)).to eq 'youth'
    end
  end

  it '19歳以上の場合、adult を返すこと' do
    expect(age_span(19)).to eq 'adult'
    expect(age_span(100)).to eq 'adult'
  end
end
