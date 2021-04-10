require "./spec_helper"
require "../src/board_builder"
require "../src/chess_piece"
require "../src/constants"

describe Chess::KnightMoveChecker do
  describe ".possible?" do
    it "returns true if a move is possible" do
      Chess::KnightMoveChecker.possible?(2, 2, 1, 0).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 0, 1).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 0, 3).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 3, 0).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 3, 4).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 4, 3).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 4, 1).should be_true
      Chess::KnightMoveChecker.possible?(2, 2, 1, 4).should be_true
    end

    it "returns false if a move is impossible" do
      Chess::KnightMoveChecker.possible?(2, 2, 7, 1).should be_false
      Chess::KnightMoveChecker.possible?(2, 2, 5, 0).should be_false
      Chess::KnightMoveChecker.possible?(2, 2, 3, 3).should be_false
      Chess::KnightMoveChecker.possible?(2, 2, 6, 2).should be_false
    end
  end
end
