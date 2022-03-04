
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String //creating a player
    var characters = [Character]()
    let maxCharacterTeamPlayer = 3
    init(playerName:String) {
        self.playerName = playerName
    }
    
    
    
    func isNameAlreadyTaken(name:String) -> Bool {
        let contains = Character.names.contains(name)
        if !contains {
            Character.names.append(name)
        }
        
        return contains
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
        if let nameValue = readLine(), !isNameAlreadyTaken(name: nameValue){
            let weapon = pickAWeapon()
            return Character(weapon: weapon,name: nameValue)
        } else {
            print ("This name is already taken, choose another name")
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
            
            print("Your weapon is \(weapon.name)")
            return weapon
        } else {
            print("wrong choice")
            return pickAWeapon()
        }
        
    }
    
    
    func pickAFighter() -> Character {
        var fighter : Character
        var characterChoice = ""
        repeat {
            if let choice = readLine() {
                characterChoice = choice
            }
            
        } while characterChoice != "1" && characterChoice != "2" && characterChoice != "3"
        
        switch characterChoice {
        case "1":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[0]
            
        case "2":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[1]
            
        case "3":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[2]
            
        default:
            fighter = self.characters[0]
        }
        return fighter
    }
    
    
    // to verify is the player is still alive, we have to check if all of his characters (team) are alive
    func playerIsAlive() -> Bool {
        for character in characters {
            if character.characterIsAlive() {
                print("\(character.name) is alive,continue the fight")
                return true
            } else {
                print("\(character.name) doesn't have any lifepoints left, he is dead, you lost this fight")

            }
            
        }
        return false
    }
    
    
}




