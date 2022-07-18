#Lets Start out with some Pseduocode to help us plan out this project
class Player
    attr_reader :name
    
    def initialize(name)
        @name = name
    end
end


class Display 
    def initialize
        @game_board = [['_','_','_'], ['_','_','_'], ['_','_','_']]
    end

    def display_board
        for item in @game_board
            print item.flatten
            puts
        end
    end
end

game = Display.new
game.display_board