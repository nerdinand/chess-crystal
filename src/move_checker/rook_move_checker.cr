require "./move_checker"

module Chess
  # 3.3 The rook may move to any square along the file or the rank on which it stands.
  class RookMoveChecker < MoveChecker
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      straight_path?(from_file_index, from_rank_index, to_file_index, to_rank_index) &&
        path_free?(from_file_index, from_rank_index, to_file_index, to_rank_index)
    end
  end
end
