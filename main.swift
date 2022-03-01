
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
        
            func startFight() {
                while playerIsAlive(playerOne){
                    playerOne.Character.cattack(opponent: <#T##Character#>)
                  
                    {
                    // this code will keep running
                      if (playerIsAlive == false)
                      {
                        // eventually if this stopping condition is true,
                        // it will break out of the while loop
                        break;
                       }
                     }
        //
        //            // rest of the program will continue
        //            <#code#>
                    
                    
                    
                    
                    func whoIsTheWinner() -> Bool {
                        if playerOne.characters.isEmpty {
                            print("\(self.playerOne.playerName) has no longer characters to play, the winner is \(self.playerTwo.playerName)")
                            
                            return true
                        }
                        if playerTwo.characters.isEmpty {
                            print("\(self.playerTwo.playerName) has no longer characters to play, the winner is \(self.playerOne.playerName)")
                            
                            return true
                        }
    }
    
    
    
    //        while playerOne.characters.count != 0 || playerTwo.characters.count != 0 {
    //            print("\(currentPlayer) choose a character from your team to start the fight")
    //
    //            let fighter = playerOne.pickAFighter()
    //
    //            let opponentFighter = playerTwo.pickAFighter()
    //            opponentFighter.attack(opponent: Character)
    
    
    
    
    
    
    
    
    let game = Game()
    game.welcomeGameMessage()
    
    
    
    
    
    
    
    
    
    
    
    
    
    // create your team, choice of 3 characters
    
    
    
