require "./move_checker"

module Chess
  class KnightMoveChecker < MoveChecker
    private INDEX_COMBINATIONS = [
      {1, 2},
      {1, -2},
      {-1, 2},
      {-1, -2},
      {2, 1},
      {-2, 1},
      {2, -1},
      {-2, -1},
    ]

    # 3.6 The knight may move to one of the squares nearest to that on which it stands but not on the same rank, file or diagonal.
    def possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int) : Bool
      INDEX_COMBINATIONS.includes?(
        {from_file_index - to_file_index, from_rank_index - to_rank_index}
      )
    end
  end
end
