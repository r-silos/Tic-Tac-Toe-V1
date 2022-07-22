class Player
    attr_reader :name
    
    def initialize(name)
        @name = name
    end
end


class Display 
    attr_accessor :game_is_over
    
    def initialize
        @game_board = [['_','_','_'], ['_','_','_'], ['_','_','_']]
        #position_picker used to help players pick spots on game board
        @position_picker = [['1','2','3'],['4','5','6'],['7','8','9']]
        #array to keep track of numbers that have been to picked to ensure proper data input
        @picked_numbers = []
        #Variable to end game when someone wins or there is a draw
        @game_is_over = false
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

    def display_all_boards
        display_game_board()
        display_position_picker()
    end
    
    def change_displays(index,symbol)
        @game_board[(index[0])][(index[1])] = symbol
        @position_picker[(index[0])][(index[1])] = '_'
        
    end

    #Function to find index of character player put in
    def find_index(num)
        row = @position_picker.find_index { |arr| arr.include?(num) }
        column = @position_picker[row].find_index { |arr| arr.include?(num) }
        return [row,column]
    end

    def picked_number_checker (num)
        if @picked_numbers.include?(num)
            while @picked_numbers.include?(num)
                print "\nRohRoe! Looks like that number has already been picked. Please enter a new number here: "
                num = gets.chomp
            end
            @picked_numbers.push(num)
            return num
        else
            @picked_numbers.push(num)
            return num
        end
    end

    def game_over_check(sym)
        i = 0
        until i == 3
            if @game_board[i].all? { |element| element == sym}
                print @game_board[i]
                puts "We have a full row"
                return @game_is_over = true
            elsif @game_board[0][i] == sym and @game_board[1][i] == sym and @game_board[2][i] == sym
                puts "we have a full column"
                return @game_is_over = true
            end
        i += 1
        end
        #(1) @game_board[0][0] == sym and @game_board[1][1] == sym and @game_board[2][2] == sym  (2) @game_board[0][2] == sym and @game_board[1][1] == sym and @game_board[2][0] == sym
        if @game_board[0][2] == sym and @game_board[1][1] == sym and @game_board[2][0] == sym or @game_board[0][0] == sym and @game_board[1][1] == sym and @game_board[2][2] == sym 
            puts "we have a full diagonal"
            return @game_is_over = true
        end
    end



end
=begin
    
puts "Hello players! Welcome to TIC - TAC - TOE"
print "\nPlayer One, please enter your name: "
name1 = gets.chomp

print "\nPlayer 2, please enter your name: "
name2 = gets.chomp

puts name1
puts name2
=end 


player1 = Player.new('john')
player2 = Player.new('jane')
game = Display.new
#game_is_over = false

puts "Hello #{player1.name} and #{player2.name}, welcome to TIC-TAC-TOE"
print "\nThis is the game board that will keep track of where X's and O's are on the board\n"
game.display_game_board
print "\nThis is the position board. Pick the corresponding number where you want to put your mark \n"
game.display_position_picker

i = 2

until game.game_is_over == true 
    if i == 11
        game.game_is_over = true
    elsif i % 2 == 0
        game.display_all_boards unless i == 2
        print "\nPlayer one, it's your turn. Pick a number to put your X on: "
        symbol = gets.chomp
        symbol = game.picked_number_checker(symbol)
        position = game.find_index(symbol)
        game.change_displays(position,'X')
        game.game_over_check('X')
    else 
        game.display_all_boards
        print "\nPlayer two, it's your turn. Pick a number to put your O on: "
        symbol = gets.chomp
        symbol = game.picked_number_checker(symbol)
        position = game.find_index(symbol)
        game.change_displays(position,'O')
        game.game_over_check('O')
    end
i += 1
end

print "\nThe Game has ended\n"
game.display_game_board