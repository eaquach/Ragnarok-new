
import Foundation

class Game {
    var playerOne : Player
    var playerTwo : Player
    var currentPlayer: Player
    var scoreOne: Int
    var scoreTwo: Int
    
    init() {
        self.playerOne = Player.createPlayer()
        self.playerTwo = Player.createPlayer()
        self.currentPlayer = playerOne
        scoreOne = 0
        scoreTwo = 0
    }
    
    func setCurrentPlayer() {
        currentPlayer = currentPlayer == playerOne ? playerTwo : playerOne
    }
    
    
    func welcomeGameMessage() {
        print("""
              Hello warriors, welcome to the combat ring!
              Congratulations, you have your entire team !
              We can now start our first fight.
              Let's go!
              """)
        
    }
    
    /* le joueur 1 choisit un personnage de son équipe et attaque le joueur de la partie adverse
     le joueur de la partie adversaire riposte avec son joueur,
     si l'un des personnages est mort dans l'équipe, on passe à un autre personnage
     on vérifie s'il y a des membres de notre équipe vivante
     */
    
    func startFight() {
        while playerOne.characters.count != 0 || playerTwo.characters.count != 0 {
            print("\(currentPlayer) choose a character from your team to start the fight")
        
            let fighter = playerOne.pickACharacter()
            let opponentFighter = playerTwo.pickACharacter()
            
            
            
            
    
        }
    }
}

let game = Game()
game.welcomeGameMessage()











// create your team, choice of 3 characters



