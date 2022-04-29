
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {// there is two players in this game
    enum ActionChoice: Int { // enumeration of two possible choices of action for the character
        case attack = 1
        case cure = 2
    }
    
    var playerName : String //each player has a name
    var characters = [Character]() // creating an array of the characters for each team
    let maxCharacterTeamPlayer = 3
    
    init(playerName:String) {
        self.playerName = playerName
    }
    
    private func isNameAlreadyTaken(name:String) -> Bool { // func to verify if the name is already taken
        let contains = Character.names.contains(name)
        if !contains {
            Character.names.append(name)
        }
        return contains
    }
    
    private func setName(name:String) -> Bool {
        return false
    }
    
    static func createPlayer() -> Player { // a static function that allows all of the propreties of this function to be use in this class
        print("\nChoose a name for your player🥷🏻\n")
        while let playerName = readLine() {
            let player = Player(playerName: playerName)
            player.createCharacters()
            return player
        }
        return Player(playerName: "unknown")
    }
    
    private func createCharacters() { // func to create the three characters, while the 3 characters are not created, repeat the code
        while characters.count < maxCharacterTeamPlayer {
            let character = createCharacter()
            characters.append(character)
        }
    }
    
    func createCharacter() -> Character { // func to give a name for the character
        print ("\nEnter a name for your character")
       
        if let nameValue = readLine(), !isNameAlreadyTaken(name: nameValue){ // if the name is already chosen, the player has to choose a different one
            let weapon = pickAWeapon()
            return Character(weapon: weapon,name: nameValue)
        } else {
            print ("This name is already taken, choose another name")
        }
        return createCharacter()
    }
    
    func pickAWeapon() -> Weapon { //  func to choose a weapon from the list
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
    
    func pickACharacter(character:Character? = nil) -> Character { // list from array characters (only alive characters)
        let aliveCharactersExcept = characters.filter({ return $0.characterIsAlive() && $0 != character })
        for (index,character) in aliveCharactersExcept.enumerated() {
            print("\nCharacter \(index):\(character.name), weapon:\(character.weapon.name), \(character.lifePoints) lifepoints\n")
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
    
    func displayLifepointsPlayer() { // func to show the list of characters with their weapon and lifepoints
        print("Your three characters are:")
        for character in characters {
            print("\(character.name), has a \(character.weapon.name), and \(character.lifePoints) lifepoints")
        }
    }
    
    func displayLifepoints() { // func to show for each player their team (name and lifepoints)
        print("\(playerName)'s team: ")
        for character in characters {
            print("\(character.name) \(character.lifePoints) lifepoints")
        }
    }
    
    func pickAnAction() -> ActionChoice { // func that able the player to choose an action for his character (attack or cure)
        print("\nPick an action for your character, by pressing 1 for attack🤺 and 2 for cure❤️‍🩹\n")
        guard let actionIndex = readLine(),
              let actionChoiceRawValue = Int(actionIndex),
              let actionChoice = ActionChoice(rawValue: actionChoiceRawValue)
        else {
            print("Wrong choice")
            return  pickAnAction()
        }
        return actionChoice
    }
    
    func isAlive() -> Bool { // func to check if the player is alive
        for character in characters {
            if character.characterIsAlive() {
                return true
            } else {
//                print("\(character.name) doesn't have any lifepoints left, he is dead")
                continue
            }
        }
        return false
    }
}









