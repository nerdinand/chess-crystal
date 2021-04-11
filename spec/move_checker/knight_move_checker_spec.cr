require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/knight_move_checker"
require "../../src/constants"

describe Chess::KnightMoveChecker do
  describe ".possible?" do
    it "returns true if a move is possible" do
      board = Chess::BoardBuilder.empty
      board['c', 3] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::KnightMoveChecker.new(board)

      move_checker.possible?(2, 2, 1, 0).should be_true
      move_checker.possible?(2, 2, 0, 1).should be_true
      move_checker.possible?(2, 2, 0, 3).should be_true
      move_checker.possible?(2, 2, 3, 0).should be_true
      move_checker.possible?(2, 2, 3, 4).should be_true
      move_checker.possible?(2, 2, 4, 3).should be_true
      move_checker.possible?(2, 2, 4, 1).should be_true
      move_checker.possible?(2, 2, 1, 4).should be_true
    end

    it "returns false if a move is impossible" do
      board = Chess::BoardBuilder.empty
      board['c', 3] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::KnightMoveChecker.new(board)

      move_checker.possible?(2, 2, 7, 1).should be_false
      move_checker.possible?(2, 2, 5, 0).should be_false
      move_checker.possible?(2, 2, 3, 3).should be_false
      move_checker.possible?(2, 2, 6, 2).should be_false
    end
  end
end
