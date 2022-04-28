
import Foundation

class Game {
    var currentPlayer = Player(playerName: "currentPlayer") // create a player 1 (teamOne)
    var opponentPlayer = Player(playerName: "opponentPlayer") // create a player 2 (teamTwo)
    
    
    
    func start() { // func for starting the game
        introductionGame()
        currentPlayer = Player.createPlayer()
        opponentPlayer = Player.createPlayer()
        welcomeGameMessage()
        fight()
        
    }
    
    
    
    func introductionGame() { // func game explanations and rules
        print("""
              Hello Warriors! Welcome to the Ragnorak battle !
              \nRagnorak battle is a combat game between two players\n
              Every player has three characters and each character has a weapon
              \nYou will have to first choose a name for your player, then for each of your character,a name and a weapon.
              The game ends when a player has no longer any character to continue the fight.
              Good luck, and let the best fighter win!\n
              """)
        
        
    }
    
    func welcomeGameMessage() { // func announcing the start of the game
        
        print("""
              Hello Warrior \(currentPlayer.playerName), Hello Warrior \(opponentPlayer.playerName), Welcome to the combat ring!
              
              Congratulations, you have complete the first step, you have created your team !
              We can now start our first fight.
              
              """)
        
    }
    
    
    
    func fight() { // start of the battle, all steps mentionned below are used as for a battle round, a loop "while" is used to run the fight
        var numberRound = 0 // allow the tracking of round number
        
        while currentPlayer.isAlive() && opponentPlayer.isAlive() {
            print("\n\(currentPlayer.playerName),it's your turn, select a character to play with , by pressing the index number :")
            
            let fighter = currentPlayer.pickACharacter()
            
            let actionChoice = currentPlayer.pickAnAction()
            
            print("\n\(opponentPlayer.playerName), now it's your turn, select a character to play with, by pressing the index number :")
            
            switch actionChoice {// using switch to allow the player to choose an action from two options for his character (attack or cure)
            case .attack :
                let opponentFighter = opponentPlayer.pickACharacter()
                print("\nA magic chest has appeared, let's see if you get the bonus")
                randomMagicChest(target: fighter)
                print("\(currentPlayer.playerName) choose to attack \(opponentFighter.name)")
                fighter.attack(opponent: opponentFighter)
                opponentFighter.displayLifepoints()
                numberRound += 1
                
            case .cure :
                print("\nYou choose cure,pick a character in your team")
                let character = currentPlayer.pickACharacter(character: fighter)
                print("You choose \(character.name) to cure ")
                fighter.cure(target: character)
                print("\(currentPlayer.playerName),")
                currentPlayer.displayLifepointsPlayer()
                
            }
            
            if let winner = whoIsTheWinner(){
                print("The battle is finished, congratulations,\(winner.playerName) is the winner!")
                print("\(currentPlayer.displayLifepoints())")
                print("\(opponentPlayer.displayLifepoints())")
                print("number of round :\(numberRound)")
                break
                
            }
            swap(&currentPlayer, &opponentPlayer)// switch the players between turns
        }
        
    }
    
    
    
    func whoIsTheWinner() -> Player? {// func to check who is the winner, if the player has no more characters, he looses the game
        
        guard currentPlayer.characters.count > 0 else {
            print("\(currentPlayer.playerName) has no longer characters to play, \(currentPlayer.playerName) lost the fight")
            return opponentPlayer
        }
        guard opponentPlayer.characters.count > 0 else {
            print("\(opponentPlayer.playerName) has no longer characters to play, \(opponentPlayer.playerName) lost the fight")
            return currentPlayer
        }
        return currentPlayer
    }
    
    
    
    func randomMagicChest(target : Character) { //the chest will appear as a bonus, if the player is getting the number 3, he will get the bonus weapon that gives more damages points
        let randomNumber = Int.random(in: 2...4)
        guard randomNumber == 3 else {
            print("\nYou didn't get the bonus, try next time\n")
            return
        }
        let magicChest = Chest()
        target.chestBonus(chest: magicChest)
        print("\nA magic chest has appeared, \(target.name) have received an extra weapon, a magic sword with \(magicChest.damagePoints)\n")
    }
    
    
    
    
    
}









