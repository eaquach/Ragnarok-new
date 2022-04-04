
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
        print("\nChoose a name for your player\n")
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
        print ("\nEnter a name for your character\n")
        if let nameValue = readLine(), !isNameAlreadyTaken(name: nameValue){
            let weapon = pickAWeapon()
            return Character(weapon: weapon,name: nameValue)
        } else {
            print ("This name is already taken, choose another name")
        }
        return createCharacter()
    }
    
    
    
    
    func pickAWeapon() -> Weapon {
        print("\nSelect a weapon from the following list, by pressing the associated number:\n")
        
        for (index, weapon) in Weapon.weapons.enumerated() {
            print("Item \(index): \(weapon.name)")
        }
        
        if let indexValue = readLine(),
           let choice = Int(indexValue),
           choice >= 0,
           choice < Weapon.weapons.count {
            let weapon =  Weapon.weapons[choice]
            
            print("\nYour weapon is a \(weapon.name)\n")
            return weapon
        } else {
            print("wrong choice")
            return pickAWeapon()
        }
        
    }
    
    
    
    func pickACharacter(character:Character? = nil) -> Character {
        print("Select a character from your team to play, by pressing the associated number:")
      
        let aliveCharacters = characters.filter({ return $0.characterIsAlive() && $0 != character }) // list of all characters
       
        for (index,character) in aliveCharacters.enumerated() {
            print("Character \(index):\(character.name), :\(character.weapon.name) ,\(character.lifePoints) lifepoints")
        }
        
        
        if let characterIndex = readLine(),
           let characterChoice = Int(characterIndex),
           
            characterChoice >= 0,
           characterChoice < maxCharacterTeamPlayer {
            let character = aliveCharacters[characterChoice]
            
            if character.characterIsAlive() {
                print("You choose \(character.name) as your character")
                return character
            } else {
                print("You have to choose a character")
            }
            
        }
        return pickACharacter(character: character)
        
    }
    
    
    
    func displayLifepointsPlayer() {
        print("\(playerName), your three characters are ")
        for character in characters {
            print("\(character.name), has a \(character.weapon.name), and \(character.lifePoints) lifepoints")
        }
        
    }
    
    
    
    func pickAnAction(character:Character) {
        
        print("Pick an action for your character, by pressing 1 for attack and 2 for cure")
        
        let aliveCharacters = characters.filter({ return $0.characterIsAlive() && $0 != character }) // list all characters + filtre d'option genre A et B
        
        for (index,character) in aliveCharacters.enumerated() {
            print("Character \(index): \(character.name)")
            
        }
        
        guard let characterIndex = readLine(),
              !characterIndex.isEmpty else {
            pickAnAction(character: character)
            return
        }
        
        
        
        guard let actionChoice = Int(characterIndex),
              actionChoice >= 0,
              actionChoice < maxCharacterTeamPlayer else {
            print("Wrong choice")
            pickAnAction(character: character)
            return
        }
        
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
    
//    func isAlive() -> Bool {
//        for character in characters {
//            guard character.characterIsAlive() else {
//                print("\(character.name) is alive,continue the fight")
//                break
//                
//            }
//            guard !character.characterIsAlive() else {
//                print("\(character.name) doesn't have any lifepoints left, he is dead, you lost this fight")
//                continue
//            }
//            
//        }
//        return false
//    }

    
    
}

