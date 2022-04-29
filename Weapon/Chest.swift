
import Foundation
class Chest: Weapon { // magic weapon, will replace the weapon that the character has
    // a new weapon will double the damagepoints
    
    init() {
        super.init(name : "magic sword🗡✨" , damagePoints: 20 )
    }
    
    override func attack() { // func attack, the magic chest double the attack points 
        print("attack with a magic sword🗡✨,\(damagePoints) damage points")
        super.attack()
    }
}
