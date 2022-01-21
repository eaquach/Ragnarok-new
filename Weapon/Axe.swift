
import Foundation

class Axe :Weapon {
    init() {
        super.init (name: "axe", damagePoints: 10)
    }
    override func attack() {
        print("attack with an axe")
        super.attack()
    }
}
let axe = Axe()
