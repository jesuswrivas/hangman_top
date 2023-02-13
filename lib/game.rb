require "psych"
require_relative "display.rb"

class Game
    attr_accessor :game_on
    attr_reader :word, :max_tries, :saved_game, :correct_guess_array, :current_tries, :attempts_array

    def initialize
        @max_tries = 12
        @current_tries = 0
        @saved_game = false
        @game_on = true
        @word = ""
        @correct_guess_array= []
        @attempts_array = []
        
    end


    def get_random_word
    #get_random_word will get randomly, one of the 9894 words from the dictionary
    #the words need to be between 5 and 12 characters
    #is not recommended to load the entire file at once (for larger files), therefore, for practice we will be
    #using the gets method.

        word_check = false
        dictionary_file = File.open("../google-10000-english-no-swears.txt","r")

        while word_check == false
            #We need a random number between 1 and 9894. 
            word_number = rand(2..9895) -1
                       
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
        @correct_guess_array = Array.new(@word.length,0)

    end


    def fill_correct_guess_array(letter)
        @word.split("").each_with_index do |val,index|
            if val == letter
                @correct_guess_array[index] = 1
            end
        end

    end

    

    def make_guess (letter)
        if @attempts_array.include?(letter)
            puts "You have already picked this one!"
        else
            if @word.include?(letter)
                Display.right_guess
                @attempts_array.push(letter)
                fill_correct_guess_array(letter)
            else
                Display.wrong_guess
                @attempts_array.push(letter)
                @current_tries += 1
            end
        end
    end



    def check_win
        @correct_guess_array.uniq.min == 1 
            
    end

    def check_lose
       @current_tries == @max_tries 
       
    end

    def reset
        @max_tries = 12
        @current_tries = 0
        @saved_game = false
        @game_on = true
        @word = ""
        @correct_guess_array= []
        @attempts_array = []
    end


    def save_game
       
        File.open("../saved_games.txt","w") do |file| 
            file.write(Psych.dump(self))       
         end
    end

    

    
end

