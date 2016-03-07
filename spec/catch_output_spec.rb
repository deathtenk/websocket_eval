require "output_catcher"
require 'rspec'
require 'pry'
include OutputCatcher

RSpec.describe "output catcher" do

  let(:caught) do
    catch_output do
      print 'abc'
    end
  end

  let(:when_passed_a_string) do
    catch_output do
      "abc"
    end
  end

  it "should catch the incoming string" do
    expect(caught).to eq('abc')
  end

  it "when passed just a string it should catch it too" do
    expect(when_passed_a_string).to eq('abc')
  end
end
