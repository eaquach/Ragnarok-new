
import Foundation

class Game {
    var currentPlayer = Player(playerName: "currentPlayer") // teamOne
    var opponentPlayer = Player(playerName: "opponentPlayer") // teamTwo
    var incrementationTour : Int = 0
//    var scoreOne :Int = 0
//    var scoreTwo :Int = 0
    //tour
    
    
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
              Every player has three characters and each character has a weapon
              \nYour first step is to choose a name for your player, then a name for each of your character and then a weapon\n
              """)
        
        
    }
    
    func welcomeGameMessage() {
        
        print("""
              Hello Warrior \(currentPlayer.playerName), Hello Warrior \(opponentPlayer.playerName), welcome to the combat ring!
              
              Congratulations, you have complete the first step, you have created your team !
              We can now start our first fight.
              
              """)
        
    }
    
    
    
    func fight() { //start of the battle, using a loop while to run the fight
        
        while currentPlayer.isAlive() && opponentPlayer.isAlive() {
            print("\n\(currentPlayer.playerName),it's your turn, select a character to play with , by pressing the index number :")
            
            let fighter = currentPlayer.pickACharacter()
            
            let actionChoice = currentPlayer.pickAnAction()
            
            print("\n\(opponentPlayer.playerName), now it's your turn,select a character to play with , by pressing the index number :")
            
            switch actionChoice {//explication
            case .attack :
                let opponentFighter = opponentPlayer.pickACharacter()
                print("\nA magic chest has appeared, let's see if you get the bonus")
                randomMagicChest(target: fighter)
                print("\(currentPlayer.playerName) choose to attack \(opponentFighter.name)")
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
//                print(game.scoreOne,game.scoreTwo)
                break
                
            }
            swap(&currentPlayer, &opponentPlayer)// switch the players between turns
        }
        
    }
    
    
    
    func whoIsTheWinner() -> Player? {
        
        guard currentPlayer.characters.isEmpty else {
            print("\(currentPlayer.playerName) has no longer characters to play, the winner is \(opponentPlayer.playerName)")
            return opponentPlayer
        }
       guard opponentPlayer.characters.isEmpty else {
            print("\(opponentPlayer.playerName) has no longer characters to play, the winner is \(currentPlayer.playerName)")
            
            return currentPlayer
        }
        return nil
    }
    
    
    
    func randomMagicChest(target : Character) { //the chest will appear as a bonus, if the player is getting the number 3, he will get the bonus weapon
        let randomNumber = Int.random(in: 2...4)
       guard randomNumber == 3 else {
           print("\nYou didn't get the bonus, try next time\n")
           return
       }
            let magicChest = Chest()
            target.chestBonus(chest: magicChest)
            print("\nA magic chest has appeared, \(target.name) have received an extra weapon, a magic sword with \(magicChest.damagePoints)\n")
        }
    
    
    
//    func tourNumbers() {
//        var incrementation = 0
//        for _ in 1... 10 {
//
//    }
//    
//    }


}









