require "colorize"

class Display


    def Display.welcome_message
        system("clear")
        puts "WELCOME TO THE HANGMAN GAME"
        puts " "
        puts "The rules are simple,"
        puts "A random world is generated and you have to guess it!"
        puts "You have 10 attempts... use them wisely."
        puts " "
        puts "You can save at anytime writng 'save' or exit anytime with 'exit'"

    end

    def Display.new_game_started
       puts "A NEW GAME HAS STARTED".green
    
    end

    def Display.load_game_started
        puts "A LOADED GAME HAS STARTED".green
    end

    def Display.new_or_load_game
        puts " "
        puts "Enter 1 to start a new game. Enter 2 to load a new one"
        word = gets.chomp

        while word != "1" and word != "2"
            puts "Sorry, I didnt understand."
            puts "Enter 1 to start a new game. Enter 2 to load a new one"
            word = gets.chomp
        end

        return word

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


 #Take user guess, also includes the save game and the exit option
#If the user writes save, the game will be saved.
#If the user writes exit, the game will be over.

    def take_user_guess
        puts "Make your guess! Enter just a single letter. Or type you can type 'save' or 'exit' the game!"
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

    def Display.saved_message
        puts " "
        puts "The game has been saved".green
        puts " "
    end

    def Display.exit_game
        puts " "
        puts "Exiting current game...".red
        puts " "
    end

    def Display.prompt_division
        puts " "
        puts "------------------------------------------------------------"
        puts " "

    end



end