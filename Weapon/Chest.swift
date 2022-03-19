
import Foundation
class Chest {
    var weapon : Weapon // création d'une nouvelle arme, une épée qui va doubler les damagePoints
    var name : String
    var damagePoints : Int
    
    init(weapon: Weapon, name : String, damagePoints: Int) {
        self.weapon = weapon
        self.name = "chest"
        self.damagePoints = 20
    }
    
   func attack() {
        attack()
        print("attack with the magic sword,\(damagePoints) damage points")
        weapon = Sword()
    }
}

let chest = Sword()
