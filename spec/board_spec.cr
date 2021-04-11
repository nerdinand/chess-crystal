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

      board['c', 5] = BLACK_KNIGHT
      board['e', 7] = WHITE_ROOK
      board.ranks[4][2].should be(BLACK_KNIGHT)
      board.ranks[6][4].should be(WHITE_ROOK)
    end

    it "raises an exception if indices are out of bounds" do
      board = Chess::Board.new

      expect_raises(IndexError) do
        board['i', 3] = BLACK_KNIGHT
      end

      expect_raises(IndexError) do
        board['b', 11] = BLACK_KNIGHT
      end
    end

    it "allows nil to remove a piece" do
      board = Chess::Board.new

      board['c', 5] = BLACK_KNIGHT
      board['c', 5] = nil

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

      board['c', 5] = BLACK_KNIGHT

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

        board.move_possible?('x', 9, 'a', 2).should be_false
        board.move_possible?('c', 3, 'a', -1).should be_false
      end
    end

    describe "no piece" do
      it "returns false if there is no piece at the from position" do
        board = Chess::Board.new

        board.move_possible?('c', 3, 'a', 2).should be_false
      end
    end

    describe "target piece" do
      it "returns false if piece at target position has same colour" do
        board = Chess::Board.new
        board['c', 3] = BLACK_KNIGHT
        board['a', 2] = Chess::ChessPiece.new_black(Chess::PAWN)

        board.move_possible?('c', 3, 'a', 2).should be_false
      end
    end

    context "knight" do
      it "returns true if a move is possible" do
        board = Chess::Board.new
        board['c', 3] = BLACK_KNIGHT

        board.move_possible?('c', 3, 'a', 2).should be_true
        board.move_possible?('c', 3, 'b', 1).should be_true
        board.move_possible?('c', 3, 'a', 4).should be_true
        board.move_possible?('c', 3, 'd', 1).should be_true
        board.move_possible?('c', 3, 'b', 5).should be_true
        board.move_possible?('c', 3, 'e', 2).should be_true
        board.move_possible?('c', 3, 'd', 5).should be_true
        board.move_possible?('c', 3, 'e', 4).should be_true
      end

      it "returns false if a move is impossible" do
        board = Chess::Board.new
        board['c', 3] = BLACK_KNIGHT

        board.move_possible?('c', 3, 'c', 3).should be_false
        board.move_possible?('c', 3, 'e', 1).should be_false
        board.move_possible?('c', 3, 'a', 3).should be_false
        board.move_possible?('c', 3, 'f', 1).should be_false
      end
    end
  end
end
