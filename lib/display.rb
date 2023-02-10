require "colorize"

class Display

    def initialize

    end


    def show_opportunities(number)
         puts "You have #{number} oportunities left..."
    end

    def Display.right_guess
        puts "Good guess!".green
    end

    def Display.wrong_guess
        puts "Incorrect!, try again...".red
    end

    def show_guesses (array)
        puts " "
        print "Letters guessed: "
        array.each {|letter| print "#{letter} "}
        puts " "
        puts " "

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
        system("clear")
        puts "Welcome to the Hangman game...."
        puts " "
       
    end

#Take user guess, also includes the save game and the exit option
#If the user writes save, the game will be saved.
#If the user writes exit, the game will be over.

    def take_user_guess
        puts "Make your guess! Enter just a single letter. Or enter save to sate the game!"
        user_guess = gets.chomp.downcase
        
        if user_guess == "save" || user_guess == "exit"
            return user_guess
        end
      
        while ("a".."z").cover?(user_guess) == false  || user_guess.length != 1
            puts "Sorry I didnt understand...Remember enter only a letter"
            puts "Make your guess! or type save to save the game!"
            user_guess = gets.chomp.downcase
            if user_guess == "save" || user_guess == "exit"
                break
            end
        end
        
        return user_guess
    end

    def Display.winning_message
        puts " "
        puts "Congratulations, you won the game!"

    end

    def Display.losing_message
        puts " "
        puts "No attempts left, you lose!"
    end


    def play_again?
        puts " "
        puts "Wanna play again?  (Y/N)"
        word = gets.chomp.downcase

        while word != "y" and word != "n"
            puts "Sorry, I didnt understand."
            puts "Wanna play again? (Y/N)"
            word = gets.chomp.downcase
        end

        return word
              

    end

    def Display.thank_you_message
        puts " "
        puts "Thank you for playing with us..."
        puts "Until next time!"
    end


    



end