
import Foundation

// Character class, parent class of all the characters

class Character {
    
    static var names = [String]()
    //    settings of all characters
    var name:String
    var lifePoints = 100
    var weapon : Weapon
    private let maxCharacterTeam = 3
    
    init(weapon: Weapon, name: String) {
        self.weapon = weapon
        self.name = name
    }
    
    func attack(opponent : Character) { // func attack: the character attacks the character of the opponent team
        print("Attack from \(name),with \(weapon.name)")
        opponent.lifePoints -= (weapon.damagePoints)
        print("\(opponent.name) looses \(weapon.damagePoints) points")
    }
    
    func cure(target : Character) { // func cure : the character chooses the action to heal a member of his team
        let curePoints = 10
        target.lifePoints += curePoints
        print("\(target.name) recovered \(curePoints) points")
    }
    
    func characterIsAlive() -> Bool { // func to see if the character is alive
        if lifePoints >= 70 {
            return true
        } else {
            return false
        }
    }
    
    func displayLifepoints() { // func to check the lifepoints of a character
        print("\(name) has \(lifePoints) life points")
    }
    
    func chestBonus(chest: Chest) { // func bonus that make appears a new weapon
        weapon = chest
    }
}

extension Character: Equatable { // using equatable to check equality between two instances and compare them
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.weapon == rhs.weapon
    }
}






