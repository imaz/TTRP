require 'rspec'

describe "fibonacci" do
	it "returns 3 if given 4" do
		fibonacci(4).should == 3
	end
end

