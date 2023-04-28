![tictactoegame](https://user-images.githubusercontent.com/25064570/235260651-11a3c299-8e2f-40fd-b132-d2e1c5fe1d7a.png)
# Tic Tac Toe Game
This project is about creating a Tic Tac Toe game with four main features. First, it allows two human players to play against each other. Second, it allows a human player to play against a sequential (computer plays sequentially). This is also known as the easy game. Third, it allows a human player to play against a random player (computer plays randomly). This is also known as the medium game. Finally, it allows a human player to play against an unbeatable computer player. This is also known as the hard game.

### Setting up Tic Tac Toe Game
The Tic Tac Toe game is set up by following these five steps:

1. Set up the board
2. Set positions (also mark position)
3. Check whether the position is empty or full
4. Check whether the board is full or not
5. If the board is full, check for the winner, loser, and tie

## Running the app
To run the app, try $ ruby app.rb in your terminal. rackup is required to load on port 4567 (for Mac).

## Basic strategy for unbeatable Tic Tac Toe games
There are a few strategies for playing unbeatable Tic Tac Toe games.

1. Win: If the player has two in a row, they can place a third to get three in a row.
2. Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
3. Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
4 Blocking an opponent's fork:
* Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork.
* Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
5. Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
6. Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
7. Empty corner: The player plays in a corner square.
8. Empty side: The player plays in a middle square on any of the 4 sides.
For more information, check out the Wikipedia article on Tic Tac Toe.  https://en.wikipedia.org/wiki/Tic-tac-toe

## Playing the game
You can play the game on this TTTboard. Have fun!
