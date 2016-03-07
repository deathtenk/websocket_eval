require "output_collector"
require "rspec"

RSpec.describe OutputCollector do

  before do
    subject.puts "foo"
  end
  
  it "should get the content" do
    expect(subject.content).to eq("foo\n")
  end
end
