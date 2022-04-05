
import Foundation

class Game {
    var currentPlayer = Player(playerName: "currentPlayer") // teamOne
    var opponentPlayer = Player(playerName: "opponentPlayer") // teamTwo
    var scoreOne :Int = 0
    var scoreTwo :Int = 0
    
    
    
    func start() {
        introductionGame()
        currentPlayer = Player.createPlayer()
        opponentPlayer = Player.createPlayer()
        welcomeGameMessage()
        fight()
        
    }
    
    
    
    func introductionGame() {
        print("""
              Hello Warriors, welcome to the Ragnorak battle !
              \nThere is two players in the combat ring\n
              Every player has three characters
              \nYour first step is to choose a name for your player and then a name for each of your character\n
              """)
        
        
    }
    
    func welcomeGameMessage() {
        
        print("""
              Hello Warrior \(currentPlayer.playerName), Hello Warrior \(opponentPlayer.playerName), welcome to the combat ring!
              
              Congratulations, you have complete the first step, you have created your team !
              We can now start our first fight.
              
              """)
        
    }
    
    //the 1st player pick a character from his team and fight the opponent character,
    //    player 2 will fight back with his character ,if one of the character from a team is dead, we choose another character to continue the fight and we check if the characters of our team is still alive
    
    
    func fight() { //start of the battle, using a loop while to run the fight
        
        while currentPlayer.isAlive() && opponentPlayer.isAlive() {
            print("\n\(currentPlayer.playerName), select a character to play with , by pressing the index number :")
            
            let fighter = currentPlayer.pickACharacter()
            
            let actionChoice = currentPlayer.pickAnAction()
          
            print("\n\(opponentPlayer.playerName), now it's your turn to choose a fighter\n")
            
            switch actionChoice {
                
                
            case .attack :
                print("\nChoose a character in the opponent team")
                let opponentFighter = opponentPlayer.pickACharacter()
                print("\nA magic chest has appeared, let's see if you get the bonus")
                randomMagicChest(target: fighter)
                print("You choose to attack \( opponentFighter.name) ")
                fighter.attack(opponent: opponentFighter)
                opponentFighter.displayLifepoints()
                
            case .cure :
                print("\nYou choose cure,pick a character in your team")
                let character = currentPlayer.pickACharacter(character: fighter)
                print("You choose \(character.name) to cure ")
                fighter.cure(target: character)
                print("\(currentPlayer.playerName),")
                currentPlayer.displayLifepointsPlayer()
                
            }
            
            
            if let winner = whoIsTheWinner(){
                print("The Battle is Finished,\(winner.playerName) is the winner")
                print(game.scoreOne , game.scoreTwo)
                break
                
            }
            swap(&currentPlayer, &opponentPlayer)
        }
        
    }
    
    
    
    func whoIsTheWinner() -> Player? {
        
        if currentPlayer.characters.isEmpty {
            print("\(currentPlayer.playerName) has no longer characters to play, the winner is \(opponentPlayer.playerName)")
            
            return opponentPlayer
        }
        if opponentPlayer.characters.isEmpty {
            print("\(opponentPlayer.playerName) has no longer characters to play, the winner is \(currentPlayer.playerName)")
            
            return currentPlayer
        }
        return nil
    }
    
    
    
    func randomMagicChest(target : Character) { //the chest will appear as a bonus, if the player is getting the number 3, he will get the bonus weapon
        let randomNumber = Int.random(in: 1...6)
        if randomNumber == 3 {
            let magicChest = Chest()
            target.chestBonus(chest: magicChest)
            print("\nA magic chest has appeared, \(target.name) have received an extra weapon, a magic sword with \(magicChest.damagePoints)\n")
        } else {
            print("\nYou didn't get the bonus, try next time\n")
        }
    }
}











