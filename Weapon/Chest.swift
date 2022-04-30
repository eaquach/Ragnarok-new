
import Foundation
class Chest: Weapon { // a magic weapon, will replace the weapon that the character has and double the damage points
    init() {
        super.init(name : "magic sword🗡✨" , damagePoints: 20 )
    }
    
    override func attack() { // func attack, the magic chest double the attack points
        print("attack with a magic sword🗡✨,\(damagePoints) damage points")
        super.attack()
    }
}
