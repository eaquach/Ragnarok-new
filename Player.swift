
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    enum ActionChoice: Int {
        case attack = 1
        case cure = 2
    }
    
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
            print("Item \(index): \(weapon.name), \(weapon.damagePoints) damage points")
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
        print("Select a character to play with , by pressing the associated number:")
        
        let aliveCharactersExcept = characters.filter({ return $0.characterIsAlive() && $0 != character }) // list of all characters
        
        for (index,character) in aliveCharactersExcept.enumerated() {
            print("Character \(index):\(character.name), \(character.weapon.damagePoints), \(character.lifePoints) lifepoints")
        }
        
        
        if let characterIndex = readLine(),
           let characterChoice = Int(characterIndex),
           
            characterChoice >= 0,
           characterChoice < maxCharacterTeamPlayer {
            let character = aliveCharactersExcept[characterChoice]
            
            if character.characterIsAlive() {
                print("You choose \(character.name) as your character")
                
                return character
            } else {
                print("You have to choose a character")
            }
            
        }
        return pickACharacter()
        
    }
    
    
    
    func displayLifepointsPlayer() {
        print("Your three characters are:")
        for character in characters {
            print("\(character.name), has a \(character.weapon.name), and \(character.lifePoints) lifepoints")
        }
        
    }
    
    
    
    func pickAnAction() -> ActionChoice {
        
        print("Pick an action for your character, by pressing 1 for attack and 2 for cure")
        
    
        guard let actionIndex = readLine(),
            let actionChoiceRawValue = Int(actionIndex),
              let actionChoice = ActionChoice(rawValue: actionChoiceRawValue)
              else {
            print("Wrong choice")
          return  pickAnAction()
            
        }
        return actionChoice
        
      
    }
    
    func isAlive() -> Bool {
        for character in characters {
            if character.characterIsAlive() {
                return true
                
            } else {
                print("\(character.name) doesn't have any lifepoints left, he is dead, you lost this fight")
            }
            
        }
        return false
    }
    

    }
    
    
    
    
    
    
    


