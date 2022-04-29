
import Foundation

class Axe :Weapon { // weapon axe, same properties as weapon 
    init() {
        super.init (name: "axe🪓", damagePoints: 10)
    }
    
   override func attack() {
        print("attack with an axe🪓")
        super.attack()
    }
}
let axe = Axe()
