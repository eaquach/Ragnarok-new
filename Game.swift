
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
              
              Every player has three characters, you first step is to choose a name for your player and then a name for each of your character

              """)
        
        
    }
    
    func welcomeGameMessage() {
    
        print("""
              Hello Warrior \(currentPlayer.playerName), Hello Warrior \(opponentPlayer.playerName), welcome to the combat ring!
              
              Congratulations, you have complete the first step, you have created your team !
              We can now start our first fight.
              
              """)
        
    }

    //the 1st player pick a character from his team and fight the opponent character .
//        player 2 will fight back with his character ,if one of the character from a team is dead, we choose another character to continue the fight
//         and we check if the characters of our team is still alive

    
    func fight() {
        
        while currentPlayer.isAlive() && opponentPlayer.isAlive() {
        print("\n\(currentPlayer.playerName), pick a fighter to start the battle\n")

            currentPlayer.displayLifepointsPlayer()
     
            let fighter = currentPlayer.pickACharacter()

            let actionChoice = currentPlayer.pickAnAction()
            

            switch actionChoice {
                
                
            case .attack :
                randomMagicChest(target: fighter)
                let opponentFighter = opponentPlayer.pickACharacter()
                print("You choose to attack \( opponentFighter.name) ")
                fighter.attack(opponent: opponentFighter)
                opponentFighter.displayLifepoints()
                
            case .cure :
                let character = currentPlayer.pickACharacter(character: fighter)
                print("You choose \(character.name) to cure ")
                fighter.cure(target: character)
        
            }
            
            print("\n\(opponentPlayer.playerName), now it's your turn to choose a fighter\n")
            if let winner = whoIsTheWinner(){
                print("The Battle is Finished,\(winner.playerName) is the winner")
                print(game.scoreOne , game.scoreTwo)
                break
                
            }
            swap(&currentPlayer, &opponentPlayer)
        }

//        swap(&currentPlayer, &opponentPlayer)
        
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
            print("A magic chest has appeared, \(target.name) have received an extra weapon, a magic sword with \(magicChest.damagePoints)")// target name + dmg pt
        } else {
            print("You didn't get the bonus, try next time")
        }
    }
}











