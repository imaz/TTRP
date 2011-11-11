require 'rspec'

def sort_string(string)
  string.split.sort.sort{|a,b| a.length<=>b.length}.join(' ')
end

describe '#sort_string' do
  it { sort_string("Awesome I am").should eq "I am Awesome" }
  it { sort_string("No Ruby No Life").should eq "No No Life Ruby" }
end
