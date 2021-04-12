require "./move_checker"

module Chess
  # 3.2 The bishop may move to any square along a diagonal on which it stands.
  class RookMoveChecker < MoveChecker
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      straight_path?(from_file_index, from_rank_index, to_file_index, to_rank_index) &&
        path_free?(from_file_index, from_rank_index, to_file_index, to_rank_index)
    end

    private def straight_path?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      from_file_index == to_file_index || from_rank_index == to_rank_index
    end
  end
end
