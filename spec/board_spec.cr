require "./spec_helper"
require "../src/board"
require "../src/chess_piece"
require "../src/constants"

describe Chess::Board do
  describe "#initialize" do
    it "generates an empty board" do
      board = Chess::Board.new

      board.ranks.should eq(
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

  describe "#[]=" do
    it "assigns a piece to a field" do
      board = Chess::Board.new

      board[AC.new("c5")] = BLACK_KNIGHT
      board[AC.new("e7")] = WHITE_ROOK
      board.ranks[4][2].should be(BLACK_KNIGHT)
      board.ranks[6][4].should be(WHITE_ROOK)
    end

    it "raises an exception if indices are out of bounds" do
      board = Chess::Board.new

      expect_raises(IndexError) do
        board[AC.new("i3")] = BLACK_KNIGHT
      end

      expect_raises(IndexError) do
        board[AC.new("b9")] = BLACK_KNIGHT
      end
    end

    it "allows nil to remove a piece" do
      board = Chess::Board.new

      board[AC.new("c5")] = BLACK_KNIGHT
      board[AC.new("c5")] = nil

      board.ranks[4][2].should be_nil
    end
  end

  describe "to_s" do
    it "returns a string representation of the board" do
      board = Chess::Board.new

      board.to_s.should eq(
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        "
      )

      board[AC.new("c5")] = BLACK_KNIGHT

      board.to_s.should eq(
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "  ♞     " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        " + "\n" +
        "        "
      )
    end
  end

  describe "#move_possible?" do
    describe "index checking" do
      it "returns false if indices are out of bounds" do
        board = Chess::Board.new

        board.move_possible?("x9", "a2").should be_false
        board.move_possible?("c3", "a0").should be_false
      end
    end

    describe "no piece" do
      it "returns false if there is no piece at the from position" do
        board = Chess::Board.new

        board.move_possible?("c3", "a2").should be_false
      end
    end

    describe "target piece" do
      it "returns false if piece at target position has same colour" do
        board = Chess::Board.new
        board[AC.new("c3")] = BLACK_KNIGHT
        board[AC.new("a2")] = Chess::ChessPiece.new_black(Chess::PAWN)

        board.move_possible?("c3", "a2").should be_false
      end
    end
  end

  describe "#piece_at_index?" do
    it "returns true if there's a piece at the index, false otherwise" do
      board = Chess::Board.new
      board[AC.new("c3")] = BLACK_KNIGHT
      board[AC.new("a2")] = Chess::ChessPiece.new_black(Chess::PAWN)

      board.piece_at_index?(2, 2).should be_true
      board.piece_at_index?(0, 1).should be_true
      board.piece_at_index?(5, 3).should be_false
      board.piece_at_index?(0, 7).should be_false
    end
  end
end
