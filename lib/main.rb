require_relative "display.rb"
require_relative "game.rb"


#Initializing Game
newGame = Game.new
newDisplay = Display.new

#Game loop. It will leave when the player wins or loses and refuses to play again
while newGame.game_on
    newGame.reset
    newGame.get_random_word
   
    newDisplay.welcome_screen

    newDisplay.show_board(newGame.word,newGame.correct_guess_array)
    
    while newGame.check_win == false && newGame.check_lose == false
        #Showing oportunities left
        newDisplay.show_opportunities(newGame.max_tries - newGame.current_tries)
        #Showing current guesses
        newDisplay.show_guesses(newGame.attempts_array)
        #Asking the user for the guess (letter)
        player_guess = newDisplay.take_user_guess
        newGame.make_guess(player_guess)
        #Displaying the board
        newDisplay.show_board(newGame.word,newGame.correct_guess_array)
    end

    #Message to the player, win/lose
    newGame.check_win ? Display.winning_message : Display.losing_message

    #Asking the player to play again
    player_choice = newDisplay.play_again?
    player_choice == "y" ? newGame.game_on = true : newGame.game_on = false

end

Display.thank_you_message





