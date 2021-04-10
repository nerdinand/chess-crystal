require "./spec_helper"
require "../src/board_builder"
require "../src/chess_piece"
require "../src/constants"

describe Chess::BoardBuilder do
  describe ".empty" do
    it "returns an empty board" do
      Chess::BoardBuilder.empty.ranks.should eq(
        [[nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, nil, nil, nil, nil, nil, nil]]
      )
    end
  end

  describe ".initial_board" do
    board = Chess::BoardBuilder.initial_board
    board.ranks[0].should eq(
      [
        Chess::ChessPiece.new_white(Chess::ROOK),
        Chess::ChessPiece.new_white(Chess::KNIGHT),
        Chess::ChessPiece.new_white(Chess::BISHOP),
        Chess::ChessPiece.new_white(Chess::QUEEN),
        Chess::ChessPiece.new_white(Chess::KING),
        Chess::ChessPiece.new_white(Chess::BISHOP),
        Chess::ChessPiece.new_white(Chess::KNIGHT),
        Chess::ChessPiece.new_white(Chess::ROOK),
      ]
    )

    board.ranks[1].should eq(
      [
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
        Chess::ChessPiece.new_white(Chess::PAWN),
      ]
    )

    (2..5).each do |rank|
      board.ranks[rank].should eq(
        [nil, nil, nil, nil, nil, nil, nil, nil]
      )
    end

    board.ranks[6].should eq(
      [
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
        Chess::ChessPiece.new_black(Chess::PAWN),
      ]
    )

    board.ranks[7].should eq(
      [
        Chess::ChessPiece.new_black(Chess::ROOK),
        Chess::ChessPiece.new_black(Chess::KNIGHT),
        Chess::ChessPiece.new_black(Chess::BISHOP),
        Chess::ChessPiece.new_black(Chess::QUEEN),
        Chess::ChessPiece.new_black(Chess::KING),
        Chess::ChessPiece.new_black(Chess::BISHOP),
        Chess::ChessPiece.new_black(Chess::KNIGHT),
        Chess::ChessPiece.new_black(Chess::ROOK),
      ]
    )
  end
end
