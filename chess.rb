class Piece
  attr_accessor :name, :position
	def initialize colour, position
		@colour = colour
		@position = position
	end
end

class Pawn < Piece
  attr_accessor :name, :position
  def initialize colour, position
    super(colour, position)
    @name = colour+"P"
  end

end

class Rook < Piece
  attr_accessor :name, :position
	def initialize colour, position
		super(colour, position)
    @name = colour+"R"
	end
end

class Bishop < Piece
  attr_accessor :name, :position
	def initialize colour, position

		super(colour, position)
    @name = colour+"B"

	end

end

class Knight < Piece
  attr_accessor :name, :position
	def initialize colour, position

		super(colour, position)
    @name = colour+"N"

	end

end

class Queen < Piece
  attr_accessor :name, :position
	def initialize colour, position
		super(colour, position)
    @name=colour+"Q"
	end

end

class King < Piece
  attr_accessor :name, :position
	def initialize colour, position
		super(colour, position)
    @name = colour + "K"
	end
end

class SetupChessBoard
  attr_accessor :piecesArray
	def initialize 
		@chessBoard = []

	end

	def LoadValuesFromInputFile

		file = File.open("simple_board.txt").read
		file.each_line do |line|
      @chessBoard.push(line.split(" "))
    end
    
    #puts @chessBoard[0]
    #puts @chessBoard[1][7]

 
	end

  def WriteToFile a
    File.open("simple_moves.txt","w") do |f|
      f.write(a)
    end
  end

  def FormatMovementInputFile 
    file = File.open("simple_moves.txt").read
    file.each_line do |line|
      line.each_char do |char|
        
        case char
        when "a"
          a = file.gsub(/a/,"7")
          WriteToFile a
        when "b"
          a = file.gsub(/b/,"6")
          WriteToFile a
        when "c"
          a = file.gsub(/c/,"5")
          WriteToFile a
        when "d"
          a = file.gsub(/d/,"4")
          WriteToFile a
        when "e"
          a = file.gsub(/e/,"3")
          WriteToFile a
        when "f"
          a = file.gsub(/f/,"2")
          WriteToFile a
        when "g"
          a = file.gsub(/g/,"1")
          WriteToFile a    
        when "h"
          a = file.gsub(/h/,"0")
          WriteToFile a
        else
          false
        end
      end
    end
  end

  def SetupBoard
    @chessBoard.each_with_index do |x,index|

      x.each_with_index do |y,index2|

        puts index.to_s + ", " + index2.to_s
        case y
        when "bR"  
          @chessBoard[index][index2] = Rook.new("b",[index,index2])
        when "bP"
          @chessBoard[index][index2] = Pawn.new("b",[index,index2])
        when "bN"
          @chessBoard[index][index2] = Knight.new("b",[index,index2])
        when "bB"
          @chessBoard[index][index2] = Bishop.new("b",[index,index2])
        when "bQ"
          @chessBoard[index][index2] = Queen.new("b",[index,index2])
        when "bK"
          @chessBoard[index][index2] = King.new("b",[index,index2])
        when "wR"
          @chessBoard[index][index2] = Rook.new("w",[index,index2])
        when "wP"
          @chessBoard[index][index2] = Pawn.new("w",[index,index2])
        when "wN"
          @chessBoard[index][index2] = Knight.new("w",[index,index2])
        when "wB"
          @chessBoard[index][index2] = Bishop.new("w",[index,index2])
        when "wQ"
          @chessBoard[index][index2] = Queen.new("w",[index,index2])
        when "wK"
          @chessBoard[index][index2] = King.new("w",[index,index2])
        when "--"
          @chessBoard[index][index2] = nil
        else
          puts "not a valid object"
        end   
      end
    end
  end

  def checkPieces
    file = File.open("simple_moves.txt")
    file.each_line do |line|


      puts @chessBoard[(((line[0].to_i + 1).to_s + line[1]).split('')[1].to_i)*-1][(((line[0].to_i + 1).to_s + line[1]).split('')[0].to_i)*-1]

=begin
      print (((line[0].to_i + 1).to_s + line[1]).split('')[1].to_i)*-1
      print " "
      puts (((line[0].to_i + 1).to_s + line[1]).split('')[0].to_i)*-1
      #puts @chessBoard[(((line[1].to_i - 1).to_s + line[0]).split('')[0].to_i)][((line[1].to_i - 1).to_s + line[0]).split('')[1].to_i]
     
      #print ((line[0] + (line[1].to_i - 1).to_s).split('')[0].to_i)
      #print " "
      #puts (line[0] + (line[1].to_i - 1).to_s).split('')[1].to_i
=end
    end
  end
end


board = SetupChessBoard.new
board.LoadValuesFromInputFile
board.FormatMovementInputFile
#board.printArray
#board.checkPiece

a = Pawn.new("b",[0,0])

board.checkPieces 


