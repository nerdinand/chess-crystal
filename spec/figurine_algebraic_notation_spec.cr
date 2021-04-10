require "./spec_helper"
require "../src/figurine_algebraic_notation"

describe Chess::FigurineAlgebraicNotation do
  describe ".[]" do
    it "returns an ASCII character representation of a piece" do
      Chess::FigurineAlgebraicNotation[WHITE_ROOK].should eq('♖')
      Chess::FigurineAlgebraicNotation[BLACK_KNIGHT].should eq('♞')
    end
  end
end
