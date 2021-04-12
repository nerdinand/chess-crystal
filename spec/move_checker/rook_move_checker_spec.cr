require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/rook_move_checker"
require "../../src/constants"

describe Chess::RookMoveChecker do
  describe ".possible?" do
    it "returns true if a move is on the straights" do
      board = Chess::BoardBuilder.empty
      board['d', 3] = Chess::ChessPiece.new_white(Chess::ROOK)
      move_checker = Chess::RookMoveChecker.new(board)

      # +, 0
      move_checker.possible?(3, 2, 4, 2).should be_true
      move_checker.possible?(3, 2, 5, 2).should be_true
      move_checker.possible?(3, 2, 6, 2).should be_true
      move_checker.possible?(3, 2, 7, 2).should be_true

      # -, 0
      move_checker.possible?(3, 2, 2, 2).should be_true
      move_checker.possible?(3, 2, 1, 2).should be_true
      move_checker.possible?(3, 2, 0, 2).should be_true

      # 0, +
      move_checker.possible?(3, 2, 3, 3).should be_true
      move_checker.possible?(3, 2, 3, 4).should be_true
      move_checker.possible?(3, 2, 3, 5).should be_true
      move_checker.possible?(3, 2, 3, 6).should be_true
      move_checker.possible?(3, 2, 3, 7).should be_true

      # 0, -
      move_checker.possible?(3, 2, 3, 1).should be_true
      move_checker.possible?(3, 2, 3, 0).should be_true
    end

    it "returns false if a move is not on the straights" do
      board = Chess::BoardBuilder.empty
      board['d', 3] = Chess::ChessPiece.new_white(Chess::ROOK)
      move_checker = Chess::RookMoveChecker.new(board)

      move_checker.possible?(4, 3, 7, 1).should be_false
      move_checker.possible?(4, 3, 5, 0).should be_false
      move_checker.possible?(4, 3, 3, 6).should be_false
      move_checker.possible?(4, 3, 6, 2).should be_false
    end

    it "returns false if a move is blocked by another piece" do
      board = Chess::BoardBuilder.empty
      board['d', 3] = Chess::ChessPiece.new_white(Chess::ROOK)
      board['d', 5] = Chess::ChessPiece.new_black(Chess::PAWN)
      board['e', 3] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::RookMoveChecker.new(board)

      # +, 0
      move_checker.possible?(3, 2, 4, 2).should be_false
      move_checker.possible?(3, 2, 5, 2).should be_false
      move_checker.possible?(3, 2, 6, 2).should be_false
      move_checker.possible?(3, 2, 7, 2).should be_false

      # -, 0
      move_checker.possible?(3, 2, 2, 2).should be_true
      move_checker.possible?(3, 2, 1, 2).should be_true
      move_checker.possible?(3, 2, 0, 2).should be_true

      # 0, +
      move_checker.possible?(3, 2, 3, 3).should be_true
      move_checker.possible?(3, 2, 3, 4).should be_false
      move_checker.possible?(3, 2, 3, 5).should be_false
      move_checker.possible?(3, 2, 3, 6).should be_false
      move_checker.possible?(3, 2, 3, 7).should be_false

      # 0, -
      move_checker.possible?(3, 2, 3, 1).should be_true
      move_checker.possible?(3, 2, 3, 0).should be_true
    end
  end
end
