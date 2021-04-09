require "./constants"
require "./figurine_algebraic_notation"

module Chess
  class ChessPiece
    def initialize(colour : Colour, piece : Piece)
      @colour = colour
      @piece = piece
    end

    getter :piece

    def self.new_white(piece : Piece)
      new(WHITE, piece)
    end

    def self.new_black(piece : Piece)
      new(BLACK, piece)
    end

    def white?
      @colour == WHITE
    end

    def black?
      @colour == BLACK
    end

    def to_s(io : IO)
      io << FigurineAlgebraicNotation[self]
    end
  end
end
