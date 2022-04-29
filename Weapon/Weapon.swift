
import Foundation
// each character has been assigned to a weapon

class Weapon { // // Weapon class, parent class of all the weapons
    var name: String
    
    static let weapons = [Axe(),BowArrow(),Sword()] // array of the three types of weapons
    
    var damagePoints : Int
    
    init (name: String,damagePoints pts: Int) {
        self.name = name
        damagePoints = pts

    }
    
    func attack(){ // func attack, using the weapon to hurt the opponent character
        print ("attack from" + String(damagePoints), "damage points with", (name))
    }
}

extension Weapon:Equatable { // using equatable to check equality between two instances and compared them
    static func == (lhs: Weapon, rhs: Weapon) -> Bool {
        return lhs.name == rhs.name
    }
}

