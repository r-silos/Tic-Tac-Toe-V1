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
        #array to keep track of numbers that have been to picked to ensure proper data input
        @picked_numbers = []
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
        if picked_numbers.include?(num)
            while picked_numbers.include?(num)
                print "\nRohRoe! Looks like that number has already been picked. Please enter a new number here: "
                num = gets.chomp
            end
            @picked_numbers.push(num)
            return num
        else
            @picked_numbers.push(num)
            return num
            

end
=begin
    
rescue => exception
    
end
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
game_is_over = false

puts "Hello #{player1.name} and #{player2.name}, welcome to TIC-TAC-TOE"
print "\nThis is the game board that will keep track of where X's and O's are on the board\n"
game.display_game_board
print "\nThis is the position board. Pick the corresponding number where you want to put your mark \n"
game.display_position_picker

i = 2

until game_is_over == true 
    if i == 11
        puts "it is the end of the game"
        game.display_all_boards 
        game_is_over = true
    elsif i % 2 == 0
        game.display_all_boards unless i == 2
        print "\nPlayer one, it's your turn. Pick a number to put your X on: "
        symbol = gets.chomp
=begin
        while picked_numbers.include?(symbol)
            print "\nRuhRoe! That number has already been picked. Please re-enter a number here: "
            symbol = gets.chomp
        picked_numbers.push(symbol)
=end
        position = game.find_index(symbol)
        game.change_displays(position,'X')
    else 
        game.display_all_boards
        print "\nPlayer two, it's your turn. Pick a number to put your O on: "
        symbol = gets.chomp
        position = game.find_index(symbol)
        game.change_displays(position,'O')
    end
i += 1
end

