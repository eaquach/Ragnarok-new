
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String
    var characters = [Character]()
    let maxCharacterTeamPlayer = 3
    init(playerName:String){
        self.playerName = playerName
    }
    
  static func isNameAlreadyTaken(name:String) -> Bool {
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
        while characters.count < maxCharacterTeamPlayer{
            let character = createCharacter()
            characters.append(character)
        }
        
    }
    
    // while the 3 characters are not created, repeat the code
    
    
    func createCharacter() -> Character {
        print ("Enter a name for your character")
        if let nameValue = readLine(), Character.characterNameIsTaken(name: character){
            let weapon = pickAWeapon()
            return Character(weapon: weapon, name: nameValue)
            
        } else {
            print ("wrong choice")
            return createCharacter()
        }
    }
    
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





