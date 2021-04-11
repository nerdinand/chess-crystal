require "./move_checker"

module Chess
  class BishopMoveChecker < MoveChecker
    # 3.2 The bishop may move to any square along a diagonal on which it stands.
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      false
    end
  end
end
