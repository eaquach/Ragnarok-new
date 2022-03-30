
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String //creating a player
    var characters = [Character]() // creating an array of characters
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
        print("Welcome to the Ragnorak battle, choose a name for your player")
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
            
            print("Your weapon is a \(weapon.name)")
            return weapon
        } else {
            print("wrong choice")
            return pickAWeapon()
        }
        
    }
    
    func pickACharacter(character:Character? = nil) -> Character {
        print("Select a character from your team to play, by pressing the associated number:")
        
        let aliveCharacters = characters.filter({ return $0.characterIsAlive() && $0 != character }) // list all characters + filtre d'option genre A et B
        
        for (index,character) in aliveCharacters.enumerated() {
            print("Character \(index): \(character.name)")
            
        }
        
        if let characterIndex = readLine(),
           let characterChoice = Int(characterIndex),
           
            characterChoice >= 0,
           characterChoice < maxCharacterTeamPlayer {
            let character = aliveCharacters[characterChoice]
            
            if character.characterIsAlive() {
                print("You choose \(character.name) as your character")
                //                return characterPlaying
                
            } else {
                print("You have to choose a character")
            }
            return pickACharacter()
            
        }
        return pickACharacter()
    }
    
   
    func pickAnAction(character:Character? = nil) -> Character {
        
        print("Pick an action for your character, by pressing 1 for attack and 2 for cure")
        
        let aliveCharacters = characters.filter({ return $0.characterIsAlive() && $0 != character }) // list all characters + filtre d'option genre A et B
        
        for (index,character) in aliveCharacters.enumerated() {
            print("Character \(index): \(character.name)")
            
        }
        
        if let characterIndex = readLine(),
           let actionChoice = Int(characterIndex),
           actionChoice >= 0,
          actionChoice < maxCharacterTeamPlayer {
           let character = aliveCharacters[actionChoice]
            
            switch actionChoice {
                
                
            case 1 :
                print("You choose \(character.name) to attack  ")
                character.attack(opponent: character)
                
                
            case 2 :
                print("You choose \(character.name) to cure ")
                character.cure(target: character)
                
            default :
                print("You have to assigned an action to your character")
                
            }
        }
        return pickAnAction()
    }
    
    
    
    
    
    
    // to verify is the player is still alive, we have to check if all of his characters (team) are alive
    func isAlive() -> Bool {
        for character in characters {
            guard character.characterIsAlive() else {
                print("\(character.name) is alive,continue the fight")
                break
                
            }
            guard !character.characterIsAlive() else {
                print("\(character.name) doesn't have any lifepoints left, he is dead, you lost this fight")
                continue
            }
            
        }
        return false
    }
    
    
    
}


