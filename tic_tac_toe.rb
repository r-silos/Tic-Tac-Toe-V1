class Player
    attr_reader :name
    
    def initialize(name)
        @name = name
    end
end


class Display 
    def initialize
        @game_board = [['_','_','_'], ['_','_','_'], ['_','_','_']]
        #position_picker used to help players pick spots on game board
        @position_picker = [['1','2','3'],['4','5','6'],['7','8','9']]
    end

    def display_game_board
        for item in @game_board 
            print item
            puts
        end
    puts
    end

    def display_position_picker
        for item in @position_picker
            print item
            puts
        end
    puts
    end
    
    
    def change_display(index,symbol)
        @game_board[(index[0])][(index[1])] = symbol
        
    end

    #Function to find index of character player put in
    def find_index(num)
        row = @position_picker.find_index { |arr| arr.include?(num) }
        column = @position_picker[row].find_index { |arr| arr.include?(num) }
        return [row,column]
    end
end

puts "Hello players! Welcome to TIC - TAC - TOE"
print "Player One, please enter your name: "
player1 = gets.chomp
print "Player Two, please enter your name: "
player2 = gets.chomp

puts player1
puts player2
=begin
#player1 = Player.new('john')
#player2 = Player.new('jane')
game = Display.new
game_is_over = false

puts "Hello #{player1.name} and #{player2.name}, welcome to TIC-TAC-TOE"
game.display_game_board
game.display_position_picker
x = game.find_index('9')

game.change_display(x,'O')
game.
=end