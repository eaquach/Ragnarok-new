
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
       
//        playerOne.createCharacter()
//        playerTwo.createCharacter()

    }
    
    func startFight()  {
        // à compléter: trouver la logique de combat avec une boucle, ne pas oublier d'intégrer le coffre aléatoire (random)
    }
}

let game = Game()
game.welcomeGameMessage()










// create your team, choice of 3 characters



