require "./spec_helper"
require "../src/board_coordinates"

describe Chess::BoardCoordinates do
  describe "#valid?" do
    it "returns true if the coordinates are valid" do
      BC.new(0, 0).valid?.should be_true
      BC.new(7, 7).valid?.should be_true
      BC.new(1, 2).valid?.should be_true
      BC.new(6, 3).valid?.should be_true
    end

    it "returns false if the coordinates are invalid" do
      BC.new(-1, 0).valid?.should be_false
      BC.new(7, 8).valid?.should be_false
    end
  end
end
