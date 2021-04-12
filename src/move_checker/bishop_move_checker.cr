require "./move_checker"

module Chess
  # 3.2 The bishop may move to any square along a diagonal on which it stands.
  class BishopMoveChecker < MoveChecker
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      diagonal_path?(from_file_index, from_rank_index, to_file_index, to_rank_index) &&
        path_free?(from_file_index, from_rank_index, to_file_index, to_rank_index)
    end

    private def diagonal_path?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      file_difference = from_file_index - to_file_index
      rank_difference = from_rank_index - to_rank_index

      file_difference.abs == rank_difference.abs
    end
  end
end
