require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/knight_move_checker"
require "../../src/constants"
require "../../src/board_coordinates"

describe Chess::KnightMoveChecker do
  describe ".possible?" do
    it "returns true if a move is possible" do
      board = Chess::BoardBuilder.empty
      board["c3"] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::KnightMoveChecker.new(board)

      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(1, 0)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(0, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(0, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(3, 0)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(3, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(4, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(4, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(1, 4)).should be_true
    end

    it "returns false if a move is impossible" do
      board = Chess::BoardBuilder.empty
      board["c3"] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::KnightMoveChecker.new(board)

      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(7, 1)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(5, 0)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(3, 3)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(2, 2), Chess::BoardCoordinates.new(6, 2)).should be_false
    end
  end
end
