require "../board"

module Chess
  abstract class MoveChecker
    def initialize(board : Board)
      @board = board
    end

    abstract def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool

    protected def path_free?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      files = from_file_index.to(to_file_index).to_a
      ranks = from_rank_index.to(to_rank_index).to_a

      # It's possible that we stay on one file/rank, therefore the corresponding array will
      # only contain one entry. In that case we need to expand it to the length of the other
      # dimension, so they zip together properly.
      if files.size == 1
        files = files * ranks.size
      elsif ranks.size == 1
        ranks = ranks * files.size
      end

      # We skip 1 because that's the source piece position
      files.zip(ranks).skip(1).none? do |file_index, rank_index|
        @board.piece_at_index?(file_index, rank_index)
      end
    end
  end
end
