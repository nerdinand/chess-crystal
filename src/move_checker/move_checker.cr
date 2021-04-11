require "../board"

module Chess
  abstract class MoveChecker
    def initialize(board : Board)
      @board = board
    end

    abstract def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
  end
end
