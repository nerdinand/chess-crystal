require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/bishop_move_checker"
require "../../src/constants"

describe Chess::BishopMoveChecker do
  describe ".possible?" do
    it "returns true if a move is on the diagonals" do
      board = Chess::BoardBuilder.empty
      board['e', 4] = Chess::ChessPiece.new_white(Chess::BISHOP)
      move_checker = Chess::BishopMoveChecker.new(board)

      # +, +
      move_checker.possible?(4, 3, 5, 4).should be_true
      move_checker.possible?(4, 3, 6, 5).should be_true
      move_checker.possible?(4, 3, 7, 6).should be_true

      # +, -
      move_checker.possible?(4, 3, 5, 2).should be_true
      move_checker.possible?(4, 3, 6, 1).should be_true
      move_checker.possible?(4, 3, 7, 0).should be_true

      # -, +
      move_checker.possible?(4, 3, 3, 4).should be_true
      move_checker.possible?(4, 3, 2, 5).should be_true
      move_checker.possible?(4, 3, 1, 6).should be_true
      move_checker.possible?(4, 3, 0, 7).should be_true

      # -, -
      move_checker.possible?(4, 3, 3, 2).should be_true
      move_checker.possible?(4, 3, 2, 1).should be_true
      move_checker.possible?(4, 3, 1, 0).should be_true
    end

    it "returns false if a move is not on the diagonals" do
      board = Chess::BoardBuilder.empty
      board['e', 4] = Chess::ChessPiece.new_white(Chess::BISHOP)
      move_checker = Chess::BishopMoveChecker.new(board)

      move_checker.possible?(4, 3, 7, 1).should be_false
      move_checker.possible?(4, 3, 5, 0).should be_false
      move_checker.possible?(4, 3, 3, 3).should be_false
      move_checker.possible?(4, 3, 6, 2).should be_false
    end

    it "returns false if a move is blocked by another piece" do
      board = Chess::BoardBuilder.empty
      board['e', 4] = Chess::ChessPiece.new_white(Chess::BISHOP)
      board['f', 5] = Chess::ChessPiece.new_black(Chess::PAWN)
      board['c', 6] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::BishopMoveChecker.new(board)

      # +, +
      move_checker.possible?(4, 3, 5, 4).should be_false
      move_checker.possible?(4, 3, 6, 5).should be_false
      move_checker.possible?(4, 3, 7, 6).should be_false

      # +, -
      move_checker.possible?(4, 3, 5, 2).should be_true
      move_checker.possible?(4, 3, 6, 1).should be_true
      move_checker.possible?(4, 3, 7, 0).should be_true

      # -, +
      move_checker.possible?(4, 3, 3, 4).should be_true
      move_checker.possible?(4, 3, 2, 5).should be_false
      move_checker.possible?(4, 3, 1, 6).should be_false
      move_checker.possible?(4, 3, 0, 7).should be_false

      # -, -
      move_checker.possible?(4, 3, 3, 2).should be_true
      move_checker.possible?(4, 3, 2, 1).should be_true
      move_checker.possible?(4, 3, 1, 0).should be_true
    end
  end
end
