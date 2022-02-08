
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String
    var characters = [Character]()
    let maxCharacterTeamPlayer = 3
    init(playerName:String) {
        self.playerName = playerName
    }
    
    
    func isNameAlreadyTaken(name:String) -> Bool {
        return false
    }
    func setName(name:String) -> Bool {
        return false
    }
    
    static func createPlayer() -> Player {
        print("Choose a name for your player")
        
        while let playerName = readLine() {
            let player = Player(playerName: playerName)
            player.createCharacters()
            return player
        }
        return Player(playerName: "unknown")
    }
    
    func createCharacters() {
        while characters.count < maxCharacterTeamPlayer {
            let character = createCharacter()
            characters.append(character)
        }
        
    }
    
    // while the 3 characters are not created, repeat the code
    
    
    func createCharacter() -> Character {
        print ("Enter a name for your character")
        if let nameValue = readLine(),!isNameAlreadyTaken(name: nameValue){  //je n'arrive pas à utiliser la fonction isnamealreadytaken
            let weapon = pickAWeapon()
            return Character(weapon: weapon,name: nameValue)
        } else {
            print ("wrong choice")
        }
        return createCharacter()
    }
    
    
    
    
    func pickAWeapon() -> Weapon {
        print("""
        Select a weapon from the following list, by pressing the associated number:
        """)
        
        for (index, weapon) in Weapon.weapons.enumerated() {
            print("Item \(index): \(weapon.name)")
        }
        
        if let indexValue = readLine(),
           let choice = Int(indexValue),
           choice >= 0,
           choice < Weapon.weapons.count {
            let weapon =  Weapon.weapons[choice]
            
            print  ("Your weapon is \(weapon.name)")
            return weapon
        } else {
            print ("wrong choice")
            return pickAWeapon()
        }
        
    }
    
    
    //   print (
    //        """
    //        Choose a character from your team to start the first battle \
    //        \press 1 for your first character to be the fighter \
    //        press 2 for your second character to be the fighter \
    //        press 3 for your third character to be the fighter \
    //        """
    //   )
    
   let playerOneTeam = [Character]() //comment délimiter les personnes 0,1,2

    
    let  playerTwoTeam = [Character]()
   
    
    func pickAFighter(character: inout[Character]) {
        var fighter : Character
        var playerChoice = ""
        repeat {
            if let entree = readLine() {
                playerChoice = entree
            }
        } while playerChoice != "1" && playerChoice != "2" && playerChoice != "3"

        switch playerChoice {
        case "1":
            fighter = self.playerOneTeam[0]
            characters.append(fighter)

        case "2":
            fighter = self.playerOneTeam[1]
            characters.append(fighter)

        case "3":
            fighter = self.playerOneTeam[2]
            characters.append(fighter)

        default:
            print("Press 1, 2 or 3")

        }

    }
//    func playerIsAlive() -> Bool {
//        while ==    < 0
//                print("Continue the fight")
//    }
//    return playerIsAlive()
}



