require "../spec_helper"
require "../../src/board_builder"
require "../../src/chess_piece"
require "../../src/move_checker/bishop_move_checker"
require "../../src/constants"

describe Chess::BishopMoveChecker do
  describe ".possible?" do
    it "returns true if a move is on the diagonals" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("e4")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::BISHOP)
      move_checker = Chess::BishopMoveChecker.new(board)

      # +, +
      move_checker.possible?(board_coordinates, BC.new(5, 4)).should be_true
      move_checker.possible?(board_coordinates, BC.new(6, 5)).should be_true
      move_checker.possible?(board_coordinates, BC.new(7, 6)).should be_true

      # +, -
      move_checker.possible?(board_coordinates, BC.new(5, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(6, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(7, 0)).should be_true

      # -, +
      move_checker.possible?(board_coordinates, BC.new(3, 4)).should be_true
      move_checker.possible?(board_coordinates, BC.new(2, 5)).should be_true
      move_checker.possible?(board_coordinates, BC.new(1, 6)).should be_true
      move_checker.possible?(board_coordinates, BC.new(0, 7)).should be_true

      # -, -
      move_checker.possible?(board_coordinates, BC.new(3, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(2, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(1, 0)).should be_true
    end

    it "returns false if a move is not on the diagonals" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("e4")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::BISHOP)
      move_checker = Chess::BishopMoveChecker.new(board)

      move_checker.possible?(board_coordinates, BC.new(7, 1)).should be_false
      move_checker.possible?(board_coordinates, BC.new(5, 0)).should be_false
      move_checker.possible?(board_coordinates, BC.new(3, 3)).should be_false
      move_checker.possible?(board_coordinates, BC.new(6, 2)).should be_false
    end

    it "returns false if a move is blocked by another piece" do
      board = Chess::BoardBuilder.empty
      algebraic_coordinates = AC.new("e4")
      board_coordinates = algebraic_coordinates.to_board_coordinates
      board[algebraic_coordinates] = Chess::ChessPiece.new_white(Chess::BISHOP)
      board[AC.new("f5")] = Chess::ChessPiece.new_black(Chess::PAWN)
      board[AC.new("c6")] = Chess::ChessPiece.new_white(Chess::KNIGHT)
      move_checker = Chess::BishopMoveChecker.new(board)

      # +, +
      move_checker.possible?(board_coordinates, BC.new(5, 4)).should be_false
      move_checker.possible?(board_coordinates, BC.new(6, 5)).should be_false
      move_checker.possible?(board_coordinates, BC.new(7, 6)).should be_false

      # +, -
      move_checker.possible?(board_coordinates, BC.new(5, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(6, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(7, 0)).should be_true

      # -, +
      move_checker.possible?(board_coordinates, BC.new(3, 4)).should be_true
      move_checker.possible?(board_coordinates, BC.new(2, 5)).should be_false
      move_checker.possible?(board_coordinates, BC.new(1, 6)).should be_false
      move_checker.possible?(board_coordinates, BC.new(0, 7)).should be_false

      # -, -
      move_checker.possible?(board_coordinates, BC.new(3, 2)).should be_true
      move_checker.possible?(board_coordinates, BC.new(2, 1)).should be_true
      move_checker.possible?(board_coordinates, BC.new(1, 0)).should be_true
    end
  end
end
