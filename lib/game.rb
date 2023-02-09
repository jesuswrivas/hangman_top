class Game
   
    attr_reader :word, :max_tries, :saved_game

    def initialize
        @max_tries = 12
        @current_tries = 0
        @saved_game = false
        @win_check = false
        @lose_check = false
        @game_on = true
        @word = ""
    end





    def get_random_word
    #get_random_word will get randomly, one of the 9894 words from the dictionary
    #the words need to be between 5 and 12 characters
    #is not recommended to load the entire file at once (for larger files), therefore, for practice we will be
    #using the gets method.

        word_check = false
        dictionary_file = File.open("google-10000-english-no-swears.txt","r")

        while word_check == false
            #We need a random number between 1 and 9894. 
            word_number = rand(2..9895) -1
            puts word_number
            
            #Skip the first n-1 lines (words) of the file
            word_number.times {dictionary_file.gets}

            #Choosing the word
            word = dictionary_file.gets.chomp
            
            #Checking if the word is between 5 and 12 characters
            if word.length.between?(5,12)
                word_check = true
            end
            
            dictionary_file.rewind
        end
            
        dictionary_file.close

        @word = word
    end



end

newGame = Game.new
newGame.get_random_word