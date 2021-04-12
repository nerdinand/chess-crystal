require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/queen_move_checker"
require "../../src/constants"
require "../../src/board_coordinates"

describe Chess::QueenMoveChecker do
  describe ".possible?" do
    it "returns true if a move is on the diagonals" do
      board = Chess::BoardBuilder.empty
      board["e4"] = Chess::ChessPiece.new_white(Chess::QUEEN)
      move_checker = Chess::QueenMoveChecker.new(board)

      # # diagonal moves

      # +, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 5)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 6)).should be_true

      # +, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 0)).should be_true

      # -, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 5)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 6)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(0, 7)).should be_true

      # -, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 0)).should be_true

      # # straight moves

      # +, 0
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 3)).should be_true

      # -, 0
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(0, 3)).should be_true

      # 0, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 5)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 6)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 7)).should be_true

      # 0, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 0)).should be_true
    end

    it "returns false if a move is not on the diagonals" do
      board = Chess::BoardBuilder.empty
      board["e4"] = Chess::ChessPiece.new_white(Chess::QUEEN)
      move_checker = Chess::QueenMoveChecker.new(board)

      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 1)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 0)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 0)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 2)).should be_false
    end

    it "returns false if a move is blocked by another piece" do
      board = Chess::BoardBuilder.empty
      board["e4"] = Chess::ChessPiece.new_white(Chess::QUEEN)
      board["f5"] = Chess::ChessPiece.new_black(Chess::PAWN)
      board["c4"] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::QueenMoveChecker.new(board)

      # # diagonal moves

      # +, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 4)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 5)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 6)).should be_false

      # +, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 0)).should be_true

      # -, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 5)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 6)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(0, 7)).should be_true

      # -, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 0)).should be_true

      # # straight moves

      # +, 0
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(5, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(6, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(7, 3)).should be_true

      # -, 0
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(3, 3)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(2, 3)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(1, 3)).should be_false
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(0, 3)).should be_false

      # 0, +
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 4)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 5)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 6)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 7)).should be_true

      # 0, -
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 2)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 1)).should be_true
      move_checker.possible?(Chess::BoardCoordinates.new(4, 3), Chess::BoardCoordinates.new(4, 0)).should be_true
    end
  end
end
