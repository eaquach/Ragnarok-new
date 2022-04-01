
import Foundation

class Game {
    var playerOne = Player(playerName: "playerOne") // teamOne
    var playerTwo = Player(playerName: "playerTwo") // teamTwo
    var currentPlayer = Player(playerName: "cuurentPlayer") // player that is playing
    var scoreOne :Int = 0
    var scoreTwo :Int = 0

    
    
    func start() {
        playerOne = Player.createPlayer()
        playerTwo = Player.createPlayer()
        currentPlayer = playerOne
        setCurrentPlayer()
        welcomeGameMessage()
        fight()
        
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

    /* the 1st player pick a character from his team and fight the opponent character .
    player 2 will fight back with his character ,if one of the character from a team is dead, we choose another character to continue the fight
     and we check if the characters of our team is still alive
     */
    
    func fight() {
        
//        while playerOne.isAlive() && playerTwo.isAlive() {
        while playerOne.characters.count != 0 && playerTwo.characters.count != 0 {
        print("\(playerOne.playerName), pick a fighter to start the battle")
            currentPlayer = playerOne
            let fighter = currentPlayer.pickACharacter()
            let characterPicked = currentPlayer.pickACharacter()
            currentPlayer.pickAnAction(character: characterPicked)
            
            
            
            print("\(playerTwo.playerName), now it's your turn to choose a fighter")
            currentPlayer = playerTwo
            let opponentFighter = currentPlayer.pickACharacter()
            let characterPicked2 = currentPlayer.pickACharacter()
            currentPlayer.pickAnAction(character: characterPicked2)
          
            
            randomMagicChest(target: fighter)
            
            fighter.attack(opponent: opponentFighter)
            opponentFighter.displayLifepoints()
            
            if let winner = whoIsTheWinner(){
                print("The Battle is Finished,\(winner.playerName) is the winner")
                print(game.scoreOne , game.scoreTwo)
                break
                
            }
        }
        
        swap(&playerOne, &playerTwo)
        
    }
    
    
    
    func whoIsTheWinner() -> Player? {
        
        if playerOne.characters.isEmpty {
            print("\(playerOne.playerName) has no longer characters to play, the winner is \(playerTwo.playerName)")
            
            return playerTwo
        }
        if playerTwo.characters.isEmpty {
            print("\(playerTwo.playerName) has no longer characters to play, the winner is \(playerOne.playerName)")
            
            return playerOne
        }
        return nil
    }
    
    
    
    func randomMagicChest(target : Character) { // comme un dé
        let randomNumber = Int.random(in: 1...6)
        if randomNumber == 3 {
            let magicChest = Chest()
            target.chestBonus(chest: magicChest)
            print("A magic chest has appeared, \(target.name) have received an extra weapon, a magic sword with \(magicChest.damagePoints)")// target name + dmg pt
        } else {
            print("You didn't get the bonus, try next time")
        }
    }
}











