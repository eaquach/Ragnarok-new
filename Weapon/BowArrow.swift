
import Foundation

class BowArrow: Weapon {
    init() {
        super.init(name: "bowArrow", damagePoints:15)
    }
    
    override func attack() {
        super.attack()
        print("attack with a bow arrow")
    }
}

let bowArrow = BowArrow()
