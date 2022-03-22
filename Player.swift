
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
    
    
    func pickAFighter() -> Character {
        print("""
        Select a character from your team to fight, by pressing the associated number:
        """)
        
        let aliveCharacters = characters.filter({ return $0.characterIsAlive() }) // list all characters + filtre d'option genre A et B
        
        for (index,character) in aliveCharacters.enumerated() {
            print("Character \(index): \(character.name)")
            
        }
        
        if let characterIndex = readLine(),
           let characterChoice = Int(characterIndex),
           characterChoice >= 0,
           characterChoice < maxCharacterTeamPlayer {
            let fighter = aliveCharacters[characterChoice]
            
            if fighter.characterIsAlive(){
                print("You choose \(fighter.name) as the fighter")
                
                return fighter
            } else {
                print("You have to choose a fighter")
                
            }
        }
        return pickAFighter()
    }
    
    
    
    // to verify is the player is still alive, we have to check if all of his characters (team) are alive
    func isAlive() -> Bool {
        for character in characters {
            if character.characterIsAlive() {
                //                print("\(character.name) is alive,continue the fight")
                return true
                
            } else {
                print("\(character.name) doesn't have any lifepoints left, he is dead, you lost this fight")
            }
            
        }
        return false
    }
    
    
    //enum case ???
    func nextAction (_: character){ // attack or cure
        print("Choose your next action : press 1 to attack, press 2 to cure")
       
        if let readLine = readLine() {

            if let choice = Int (readLine) {
                switch choice {
                case 1:
                    self.cure(target: playerOne.characters) // choisir des characters de son équipe
                case 2:
                    self.attack(opponent: actualCharacter)
                default:
                    print("Choose your next action")

                }
            }
        }
    
    }
    
}




