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
end
