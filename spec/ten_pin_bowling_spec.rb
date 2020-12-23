# frozen_string_literal: true

RSpec.describe TenPinBowling do
  it "has a version number" do
    expect(TenPinBowling::VERSION).not_to be nil
  end
end

RSpec.describe TenPinBowling::CLI do
  describe "CLI.main" do
    ["", "--help", "-h"].each do |params|
      xit "should return the helper when params are #{params}" do
        expect(TenPinBowling::CLI.new.main(params)).to nil
      end
    end

    xit "should process the inputed file when is sent" do
    end
  end
end
