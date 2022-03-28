
import Foundation
// each character has been assigned to a weapon


class Weapon {
    var name: String 
    static let weapons = [Axe(),BowArrow(),Sword()]
    
    var damagePoints : Int
    
    init (name: String,damagePoints pts: Int) {
        self.name = name
        damagePoints = pts
        
        
    }
    
    func attack(){
        print ("attack from" + String(damagePoints), "damage points with", (name))
    }
}


extension Weapon:Equatable {
    static func == (lhs: Weapon, rhs: Weapon) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}

