require "./chess_piece"
require "./board"
require "./constants.cr"

module Chess
  class BoardBuilder
    def self.initial_board
      empty.tap do |board|
        # white base rank
        board['a', 1] = ChessPiece.new_white(ROOK)
        board['b', 1] = ChessPiece.new_white(KNIGHT)
        board['c', 1] = ChessPiece.new_white(BISHOP)
        board['d', 1] = ChessPiece.new_white(QUEEN)
        board['e', 1] = ChessPiece.new_white(KING)
        board['f', 1] = ChessPiece.new_white(BISHOP)
        board['g', 1] = ChessPiece.new_white(KNIGHT)
        board['h', 1] = ChessPiece.new_white(ROOK)

        # white pawn rank
        ('a'..'h').each do |file|
          board[file, 2] = ChessPiece.new_white(PAWN)
        end

        # black base rank
        board['a', 8] = ChessPiece.new_black(ROOK)
        board['b', 8] = ChessPiece.new_black(KNIGHT)
        board['c', 8] = ChessPiece.new_black(BISHOP)
        board['d', 8] = ChessPiece.new_black(QUEEN)
        board['e', 8] = ChessPiece.new_black(KING)
        board['f', 8] = ChessPiece.new_black(BISHOP)
        board['g', 8] = ChessPiece.new_black(KNIGHT)
        board['h', 8] = ChessPiece.new_black(ROOK)

        # black pawn rank
        ('a'..'h').each do |file|
          board[file, 7] = ChessPiece.new_black(PAWN)
        end
      end
    end

    def self.empty
      Board.new
    end
  end
end
