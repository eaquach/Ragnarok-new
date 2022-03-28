
import Foundation
class Chest: Weapon {
   // création d'une nouvelle arme, une épée qui va doubler les damagePoints
    
    init() {
        super.init(name : "magic sword" , damagePoints: 20 )
     
    }
    override func attack() {
        print("attack with a magic sword,\(damagePoints) damage points")
        super.attack()
    }
    
   
}
