require 'rspec'

def fibonacci(count)
	fib = 1
	before = 0
	for i in 1...count do
		fib += before
		before = fib - before
	end
	fib
end

describe "fibonacci" do
	it "returns 3 if given 4" do
		fibonacci(4).should == 3
	end
end

