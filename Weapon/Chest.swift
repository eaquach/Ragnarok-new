
import Foundation
class Chest: Weapon {
   // a new weapon will double the damagepoints s
    
    init() {
        super.init(name : "magic sword" , damagePoints: 20 )
     
    }
    override func attack() {
        print("attack with a magic sword,\(damagePoints) damage points")
        super.attack()
    }
    
   
}
