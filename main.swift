
import Foundation

class Game {
    var playerOne : Player // teamOne
    var playerTwo : Player // teamTwo
    var currentPlayer: Player // player that is playing
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
              Hello warrior \(playerOne.playerName), hello warrior \(playerTwo.playerName), welcome to the combat ring!
              
              Congratulations, you have complete the first step, you have created your team !
              We can now start our first fight.
              """)
        
    }
    
    
    /* le joueur 1 choisit un personnage de son équipe et attaque le joueur de la partie adverse
     le joueur de la partie adversaire riposte avec son joueur,
     si l'un des personnages est mort dans l'équipe, on passe à un autre personnage
     on vérifie s'il y a des membres de notre équipe vivante
     */
    func startGame () {
        while playerOne.isAlive() || playerTwo.isAlive() {
            fight()
        }
    }
    
    func fight() {
        print("\(playerOne.playerName), pick a fighter to start the battle")
        let fighter = playerOne.pickAFighter()
        
        print("\(playerTwo.playerName), now it's your turn to choose a fighter")
        let opponentFighter = playerTwo.pickAFighter()
        
        while fighter.characterIsAlive() || opponentFighter.characterIsAlive() {
            fighter.attack(opponent: opponentFighter)
            opponentFighter.attack(opponent: fighter)
            
            if playerTwo.isAlive() == true {
                continue
            }
            if playerTwo.isAlive() == false {
                break
            }
            swap(&playerOne, &playerTwo)
            
        }
        
    }

    
    func whoIsTheWinner() -> Player {
        if playerOne.characters.isEmpty {
            print("\(self.playerOne.playerName) has no longer characters to play, the winner is \(self.playerTwo.playerName)")
            
            return playerTwo
        }
        if playerTwo.characters.isEmpty {
            print("\(self.playerTwo.playerName) has no longer characters to play, the winner is \(self.playerOne.playerName)")
            
            return playerOne
        }
        return currentPlayer
    }
}







let game = Game()
game.welcomeGameMessage()
game.startGame()









