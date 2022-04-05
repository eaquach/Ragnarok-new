
import Foundation

// Character class, parent class of all the characters

class Character {
    
    static var names = [String]()
    
    //    settings of all characters
    var name:String
    var lifePoints = 100
    var weapon : Weapon
    let maxCharacterTeam = 3
    init(weapon: Weapon, name: String) {
        self.weapon = weapon
        self.name = name
    }
    
    
    
    func attack(opponent : Character) {
        print("Attack from \(name),with \(weapon.name)")
        opponent.lifePoints -= (weapon.damagePoints)
        print("\(opponent.name) looses \(weapon.damagePoints) points")
        
    }
    
    
    func cure(target : Character){
        let curePoints = 10
        target.lifePoints += curePoints
        print("\(target.name) recovered \(curePoints) points")
    }
    
    
    
    func characterIsAlive() -> Bool {
        if lifePoints > 80 {
            //            print ("\(name), has \(lifePoints) lifepoints left")
            return true
        } else {
            //            print("Your \(name) is dead, choose another character to fight")
            return false
        }
        
    }
    
    func displayLifepoints() {
        print("\(name) has \(lifePoints) life points")
    }
    
    
    
    
    func chestBonus(chest: Chest) {
        weapon = chest
    }
    
    
    
    
    
    
    
    
    
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.weapon == rhs.weapon
    }
    
    
    
}






