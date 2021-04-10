require "./spec_helper"
require "../src/chess_piece"
require "../src/constants"

describe Chess::ChessPiece do
  describe "#white?" do
    it "returns true if piece is white, false otherwise" do
      WHITE_ROOK.white?.should be_true
      BLACK_KNIGHT.white?.should be_false
    end
  end

  describe "#black?" do
    it "returns true if piece is black, false otherwise" do
      WHITE_ROOK.black?.should be_false
      BLACK_KNIGHT.black?.should be_true
    end
  end

  describe "#to_s" do
    it "returns an ASCII character representation" do
      WHITE_ROOK.to_s.should eq("♖")
      BLACK_KNIGHT.to_s.should eq("♞")
    end
  end

  describe "#==" do
    it "returns true if pieces have the same colour and piece" do
      WHITE_ROOK.should eq Chess::ChessPiece.new_white(Chess::ROOK)
      WHITE_ROOK.should_not eq Chess::ChessPiece.new_white(Chess::PAWN)
      BLACK_KNIGHT.should_not eq(nil)
    end
  end
end
