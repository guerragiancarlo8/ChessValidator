class Piece
	def initialize colour, position
		@colour = colour
		@position = position
	end
end

class Pawn < Piece
  def initialize colour, position
    super(colour, position)
  end
end

class Rook < Piece
	def initialize colour, position
		super(colour, position)
	end
end


end

class Bishop < Piece
	def initialize colour, position

		super(colour, position)

	end

end

class Knight < Piece
	def initialize colour, position

		super(colour, position)

	end

end

class Queen < Piece
	def initialize colour, position
		super(colour, position)
	end

end

class King < Piece
	def initialize colour, position
		super(colour, position)
	end
end

class Pawn < Piece
  def initialize colour, position
    super(colour, position)
  end
end

class SetupChessBoard
	def initialize 
		@chessboard = Array.new(8) {Array.new(8)}
		@piecesArray = []

	end

	def LoadValuesFromInputFile

		file = File.open("simple_board.txt").read
		file.each_line do |line|
      @piecesArray.push(line.split(" "))
    end
    
	end

  def SetupBoard

    #constructor de objetos 
    @piecesArray.each do |x|
      @piecesArray.each do |y|
        case y
        when "bR"
          Rook.new("Black",[location])
        when "bP"
          Pawn.new("Black",[location])
        when "bN"
          Knight.new("Black",[location])
        when "bB"
          Bishop.new("Black",[location])
        when "bQ"
          Queen.new("Black",[location])
        when "bK"
          King.new("Black",[location])
  end
end


SetupChessBoard.new.LoadValuesFromInputFile