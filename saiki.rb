# coding : UTF-8
require 'rspec'

def total_saiki1(nodes, sum=0)
  return sum if nodes.empty?
  head = nodes.shift
  if head.is_a?(Array)
    sum += total_saiki1(head)
  else
    sum += head
  end
  total_saiki1(nodes, sum)
end

def saiki2(nodes)
  return 0 if nodes.empty?
  head = nodes.shift
  head + saiki2(nodes)
end

describe '1 から 10 までの合計について' do
  let (:nodes) { (1..10).to_a }

  context '普通にすべて足した場合' do
    it '55 になる' do
      nodes.inject(:+).should eq(55)
    end
  end

  context '再帰呼び出しで計算した場合' do
    it '55 になる' do
      total_saiki1(nodes).should eq(55)
    end

    let (:nested1) { [1, [2, 3, 4]] }
    it '10 になる' do
      total_saiki1(nested1).should eq(10)
    end

    let (:nested2) { [1, [2, [3, [4, 5]]]] }
    it '15 になる' do
      total_saiki1(nested2).should eq(15)
    end
  end
end
