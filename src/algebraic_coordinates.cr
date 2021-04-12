require "./board_coordinates"

module Chess
  class AlgebraicCoordinates
    def initialize(coordinates : String)
      raise ArgumentError.new if coordinates.size != 2

      @file = coordinates[0]
      @rank = coordinates[1].to_i
    end

    private def initialize(file : Char, rank : Int32)
      @file = file
      @rank = rank
    end

    def to_board_coordinates
      BoardCoordinates.new(file_index, rank_index)
    end

    def file_index : Int
      @file.ord - 'a'.ord
    end

    def rank_index : Int
      @rank - 1
    end
  end
end
