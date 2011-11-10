require 'rspec'

def sort_string(string)
  #given 'Awesome I am'
  #return 'I am Awesome'
  words = Hash.new()
  string.split.each{|word|
    words[word.length] = word
  }
  Hash[*words.sort.flatten].values.join(' ')
end

describe '#sort_string' do
  it { sort_string("Awesome I am").should eq "I am Awesome" }
  it { sort_string("No Ruby No Life").should eq "No No Ruby Life" }
end
