require "../spec_helper"
require "../../src/board_builder"
require "../../src/move_checker/rook_move_checker"
require "../../src/constants"
require "../../src/board_coordinates"

describe Chess::RookMoveChecker do
  describe ".possible?" do
    it "returns true if a move is on the straights" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("d3")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::ROOK)
      move_checker = Chess::RookMoveChecker.new(board)

      # +, 0
      move_checker.possible?(board_coordinates, BC.new(4, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(5, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(6, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(7, 2)).should be_true

      # -, 0
      move_checker.possible?(board_coordinates, BC.new(2, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(1, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(0, 2)).should be_true

      # 0, +
      move_checker.possible?(board_coordinates, BC.new(3, 3)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 4)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 5)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 6)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 7)).should be_true

      # 0, -
      move_checker.possible?(board_coordinates, BC.new(3, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 0)).should be_true
    end

    it "returns false if a move is not on the straights" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("d3")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::ROOK)
      move_checker = Chess::RookMoveChecker.new(board)

      move_checker.possible?(board_coordinates, BC.new(6, 0)).should be_false
      move_checker.possible?(board_coordinates, BC.new(4, 1)).should be_false
      move_checker.possible?(board_coordinates, BC.new(2, 5)).should be_false
      move_checker.possible?(board_coordinates, BC.new(5, 1)).should be_false
    end

    it "returns false if a move is blocked by another piece" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("d3")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::ROOK)
      board[AC.new("d5")] = Chess::ChessPiece.new_black(Chess::PAWN)
      board[AC.new("e3")] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::RookMoveChecker.new(board)

      # +, 0
      move_checker.possible?(board_coordinates, BC.new(4, 2)).should be_false
      move_checker.possible?(board_coordinates, BC.new(5, 2)).should be_false
      move_checker.possible?(board_coordinates, BC.new(6, 2)).should be_false
      move_checker.possible?(board_coordinates, BC.new(7, 2)).should be_false

      # -, 0
      move_checker.possible?(board_coordinates, BC.new(2, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(1, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(0, 2)).should be_true

      # 0, +
      move_checker.possible?(board_coordinates, BC.new(3, 3)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 4)).should be_false
      move_checker.possible?(board_coordinates, BC.new(3, 5)).should be_false
      move_checker.possible?(board_coordinates, BC.new(3, 6)).should be_false
      move_checker.possible?(board_coordinates, BC.new(3, 7)).should be_false

      # 0, -
      move_checker.possible?(board_coordinates, BC.new(3, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(3, 0)).should be_true
    end
  end
end
