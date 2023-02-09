require "colorize"

class Display

    def initialize

    end


    def show_opportunities(number)
         puts "You have #{number} oportunities left..."
    end

    def right_guess
        puts "Good guess!".green
    end

    def wrong_guess
        puts "Incorrect!, try again...".red
    end



    def show_board (word, result_array)
        
        result_array.each_with_index do |letter, index|
            if letter == 1
                print " "
                print word[index]
                print " "
            else
                print " "
                print "_"
                print " "
            end
        end
        puts " "
        puts " "
    end


    def welcome_screen
        puts "Welcome to the Hangman game...."
        puts " "
       
    end


    def take_user_guess
        puts "Make your guess! Enter just a single letter"
        user_guess = gets.chomp.downcase
        
        while ("a".."z").cover?(user_guess) == false  || user_guess.length != 1
            puts "Sorry I didnt understand...Remember enter only a letter"
            puts "Make your guess!"
            user_guess = gets.chomp.downcase
        end
        "ab"
        return user_guess
    end




end