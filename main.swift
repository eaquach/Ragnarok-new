
import Foundation

class Game {
    var playerOne : Player
    var playerTwo : Player
    var currentPlayer: Player
    
    init() {
        self.playerOne = Player.createPlayer()
        self.playerTwo = Player.createPlayer()
            self.currentPlayer = playerOne
        }
    
    func setCurrentPlayer() {
        currentPlayer = currentPlayer == playerOne ? playerTwo : playerOne
    }
    
    
    func welcomeGameMessage() {
        print("""
              Hello warriors, welcome to the combat ring!
              Congratulations, you have your entire team!
              We can now start our first fight.
              Let's go!
              """)

    }
    
    func startFight()  {
//        playerOne.characters.attack()
//        playerTwo.characters.attack()
    }
}

let game = Game()
game.welcomeGameMessage()











// create your team, choice of 3 characters



