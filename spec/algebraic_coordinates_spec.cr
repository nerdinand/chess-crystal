require "./spec_helper"
require "../src/board_coordinates"

describe Chess::AlgebraicCoordinates do
  describe "#to_board_coordinates?" do
    it "returns the corresponding board coordinates" do
      AC.new("a1").to_board_coordinates.should eq(BC.new(0, 0))
      AC.new("h8").to_board_coordinates.should eq(BC.new(7, 7))
      AC.new("c7").to_board_coordinates.should eq(BC.new(2, 6))
      AC.new("f3").to_board_coordinates.should eq(BC.new(5, 2))
    end
  end
end
