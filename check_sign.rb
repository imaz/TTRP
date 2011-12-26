# coding : UTF-8
require 'rspec'

def check_sign(number)
  if number.zero?
    '#{number} is zero'
  elsif number.polar[1].eql? Math::PI
    '#{number} is negative'
  else
    '#{number} is positive'
  end
end

def check_sign2(number)
  case number<=>0
  when -1
    '#{number} is negative'
  when 0
    '#{number} is zero'
  when 1
    '#{number} is positive'
  end
end

describe 'check_sign' do
  context '0を渡した場合' do
    it 'zero と判別されること' do
      check_sign(0).should include('zero')
    end
  end
  context '正数を渡した場合' do
    it 'positive と判別されること' do
      check_sign(255).should include('positive')
    end
  end
  context '負数を渡した場合' do
    it 'negative と判別されること' do
      check_sign(-482).should include('negative')
    end
  end
end

describe 'check_sign2' do
  it { check_sign2(0).should include('zero') }
  it { check_sign2(100).should include('positive') }
  it { check_sign2(-10).should include('negative') }
end

