require "./move_checker"

module Chess
  # 3.2 The bishop may move to any square along a diagonal on which it stands.
  class BishopMoveChecker < MoveChecker
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      diagonal_path?(from_file_index, from_rank_index, to_file_index, to_rank_index) &&
        diagonal_path_free?(from_file_index, from_rank_index, to_file_index, to_rank_index)
    end

    private def diagonal_path?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      file_difference = from_file_index - to_file_index
      rank_difference = from_rank_index - to_rank_index

      file_difference.abs == rank_difference.abs
    end

    private def diagonal_path_free?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      file_iterator = from_file_index.to(to_file_index)
      rank_iterator = from_rank_index.to(to_rank_index)

      # we skip 1 because that's the source piece position
      file_iterator.zip(rank_iterator).skip(1).none? do |file_index, rank_index|
        @board.piece_at_index?(file_index, rank_index)
      end
    end
  end
end
