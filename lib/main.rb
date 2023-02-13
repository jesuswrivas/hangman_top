require_relative "display.rb"
require_relative "game.rb"

game_on = true

#Game loop. It will leave when the player wins or loses and refuses to play again
while game_on

    #Initializing Game
    Display.welcome_message
    newDisplay = Display.new
    #New game or load game?
   
    new_or_load = Display.new_or_load_game

    if new_or_load == "1"
        newGame = Game.new

    else
        open_file = File.open("../saved_games.txt","r")
        open_file.rewind
        newGame =  Psych.load(open_file.read,permitted_classes: [Game])
        open_file.close
        newGame.saved_game = true    
    end

    system("clear")

    newGame.saved_game == true ? Display.load_game_started : Display.new_game_started 

    newDisplay.show_board(newGame.word,newGame.correct_guess_array)
    
    while newGame.check_win == false && newGame.check_lose == false
        #Showing oportunities left
        newDisplay.show_opportunities(newGame.max_tries - newGame.current_tries)
        #Showing current guesses
        newDisplay.show_guesses(newGame.attempts_array)
        #Asking the user for the guess (letter)
        player_guess = newDisplay.take_user_guess
        
        
        #Optional input to save/exit the game
        if player_guess == "save"
            Display.saved_message
            newGame.save_game
            next
        elsif player_guess == "exit"
            Display.exit_game
            break
        end

        Display.prompt_division
        newGame.make_guess(player_guess)
        #Displaying the board
        newDisplay.show_board(newGame.word,newGame.correct_guess_array)
        #Win/Lose message to the player        
        Display.losing_message if newGame.check_lose
        Display.winning_message if newGame.check_win
    end   
        

    #Asking the player to play again
    player_choice = newDisplay.play_again?
    game_on = true
    player_choice == "y" ? newGame.reset : game_on = false

end

Display.thank_you_message





