require_relative "display.rb"
require_relative "game.rb"

#Initializing Game
newGame = Game.new
newGame.get_random_word
puts newGame.word
newDisplay = Display.new

#Welcome Screen
newDisplay.welcome_screen

 #Displaying the board
 newDisplay.show_board(newGame.word,newGame.correct_guess_array)

while newGame.check_win == false && newGame.check_lose == false
     #Showing oportunities left
    newDisplay.show_opportunities(newGame.max_tries - newGame.current_tries)

    #Asking the user for the guess (letter)
    player_guess = newDisplay.take_user_guess
    newGame.make_guess(player_guess)

     #Displaying the board
    newDisplay.show_board(newGame.word,newGame.correct_guess_array)
end



