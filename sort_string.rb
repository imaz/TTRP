require 'rspec'

def sort_string(string)
  #given 'Awesome I am'
  #return 'I am Awesome'
  words = Hash.new()
  string.split.each{|word|
    words[word] = word.length
  }
  Hash[*words.sort.sort{|a,b| a[1]<=>b[1] }.flatten].keys.join(' ')
end

describe '#sort_string' do
  it { sort_string("Awesome I am").should eq "I am Awesome" }
  it { sort_string("No Ruby No Life").should eq "No Life Ruby" }
end
