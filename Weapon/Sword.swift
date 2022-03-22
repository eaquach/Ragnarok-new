
import Foundation

class Sword : Weapon {
    init () {
        super.init(name : "sword" , damagePoints: 10 )
    }

    
    override func attack() {
        print("attack with a sword")
        
        super.attack()
    }
    
}
let sword = Sword ()
