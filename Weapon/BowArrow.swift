
import Foundation

class BowArrow: Weapon {  // weapon bowArrow, same properties as weapon 
    init() {
        super.init(name: "bowArrow", damagePoints:10)
    }
    
    override func attack() {
        super.attack()
        print("attack with a bow arrow")
    }
}

let bowArrow = BowArrow()
