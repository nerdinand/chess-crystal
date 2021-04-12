require "./chess_piece"
require "./board"
require "./constants.cr"

module Chess
  class BoardBuilder
    def self.empty
      Board.new
    end

    def self.initial_board
      empty.tap do |board|
        # white base rank
        board["a1"] = ChessPiece.new_white(ROOK)
        board["b1"] = ChessPiece.new_white(KNIGHT)
        board["c1"] = ChessPiece.new_white(BISHOP)
        board["d1"] = ChessPiece.new_white(QUEEN)
        board["e1"] = ChessPiece.new_white(KING)
        board["f1"] = ChessPiece.new_white(BISHOP)
        board["g1"] = ChessPiece.new_white(KNIGHT)
        board["h1"] = ChessPiece.new_white(ROOK)

        # white pawn rank
        ('a'..'h').each do |file|
          board["#{file}2"] = ChessPiece.new_white(PAWN)
        end

        # black base rank
        board["a8"] = ChessPiece.new_black(ROOK)
        board["b8"] = ChessPiece.new_black(KNIGHT)
        board["c8"] = ChessPiece.new_black(BISHOP)
        board["d8"] = ChessPiece.new_black(QUEEN)
        board["e8"] = ChessPiece.new_black(KING)
        board["f8"] = ChessPiece.new_black(BISHOP)
        board["g8"] = ChessPiece.new_black(KNIGHT)
        board["h8"] = ChessPiece.new_black(ROOK)

        # black pawn rank
        ('a'..'h').each do |file|
          board["#{file}7"] = ChessPiece.new_black(PAWN)
        end
      end
    end
  end
end
