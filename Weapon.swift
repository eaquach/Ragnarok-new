
import Foundation
// each character has been assigned to a weapon


class Weapon {
    var name: String 
    static let weapons = [Axe(),BowArrow(),Sword()]
    
//    static let weapons = [1:Axe(),2:BowArrow(),3:Sword()]
//    comment faire pour définir une saisie par chiffre dans le tableau if choice  == weapons[0] {
//        // Axe
//    }
//    else if choice == weapons [1] {
//        // BowArrow
//    } else if choice == weapons [2] {
//        // Sword
//    }

    var damagePoints : Int
    
    init (name: String,damagePoints pts: Int) {
        self.name = name
        damagePoints = pts
        
        
    }
    
    func attack(){
        print ("attack from" + String(damagePoints), "damage points with", (name))
    }
}




