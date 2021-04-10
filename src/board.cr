require "./chess_piece"

module Chess
  class Board
    def initialize
      @ranks = Array(Array(ChessPiece?)).new(8) do |i|
        Array(ChessPiece?).new(8, nil)
      end
    end

    def ranks
      @ranks
    end

    def []=(file : Char, rank : Int, piece : ChessPiece?)
      @ranks[rank - 1][file_to_index(file)] = piece
    end

    def to_s(io : IO)
      io << ranks.reverse.map do |rank|
        rank.map { |e| e.nil? ? ' ' : e }.join
      end.join("\n")
    end

    private def file_to_index(file : Char) : Int
      file.ord - 'a'.ord
    end
  end
end
