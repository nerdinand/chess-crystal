module Chess
  class KnightMoveChecker
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

    def self.possible?(from_file_index : Int, from_rank_index : Int, to_file_index : Int, to_rank_index : Int)
      INDEX_COMBINATIONS.includes?(
        {from_file_index - to_file_index, from_rank_index - to_rank_index}
      )
    end
  end
end
