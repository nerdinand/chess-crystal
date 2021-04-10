require "./chess_piece"
require "./constants"
require "./move_checker"

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
      @ranks[rank_to_index(rank)][file_to_index(file)] = piece
    end

    def [](file : Char, rank : Int)
      @ranks[rank_to_index(rank)][file_to_index(file)]
    end

    def to_s(io : IO)
      io << ranks.reverse.map do |rank|
        rank.map { |e| e.nil? ? ' ' : e }.join
      end.join("\n")
    end

    def move_possible?(from_file : Char, from_rank : Int, to_file : Char, to_rank : Int)
      from_file_index = file_to_index(from_file)
      from_rank_index = rank_to_index(from_rank)
      return false unless indices_valid?(from_file_index, from_rank_index)

      to_file_index = file_to_index(to_file)
      to_rank_index = rank_to_index(to_rank)
      return false unless indices_valid?(to_file_index, to_rank_index)

      piece = @ranks[from_rank_index][from_file_index]

      return false if piece.nil?

      case piece.piece
      when KNIGHT
        KnightMoveChecker.possible?(from_file_index, from_rank_index, to_file_index, to_rank_index)
      else
        false
      end
    end

    private def indices_valid?(file_index, rank_index)
      (0..7).includes?(file_index) && (0..7).includes?(rank_index)
    end

    private def file_to_index(file : Char) : Int
      file.ord - 'a'.ord
    end

    private def rank_to_index(rank : Int) : Int
      rank - 1
    end
  end
end
