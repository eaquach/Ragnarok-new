
import Foundation
class Chest: Weapon {
    init() {
        super.init(name: "chest", damagePoints:20)
    }
    
    override func attack() {
        super.attack()
        print("A magic chest has appeared, you have received an extra weapon, a sword")
    }
}

let chest = Chest()
