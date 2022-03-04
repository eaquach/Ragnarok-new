
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
    
    func startGame() {
//        setCurrentPlayer()
        playerStart = isPlayerOneStart? playerOne: playerTwo
        notPlayerStart = isPlayerOneStart? playerTwo :playerOne
        
        guard let playerStart = playerStart else { return }
        guard let notPlayerStart = notPlayerStart else { return}
        
        if playerStart {
            print("\(name.playerOne), choose to attack or heal")
        } else {
            print("\(name.playerTwo), choose to attack or heal")
        }
        
        playerStart.characterIsAlive()
        
            
            
            //            while gameIsOn (playerOne.pickAFighter()) && (playerTwo.pickAFighter()){
            //                    print("the battle is still on, don't give up")
            //                    let fighter = playerOne.pickAFighter()
            //                    let opponent = playerTwo.pickAFighter()
            //                fighter.attack(opponent: Character)
            //                    opponent.attack(opponent: Character)
            
            
            
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














// create your team, choice of 3 characters



