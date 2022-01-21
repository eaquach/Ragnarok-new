
import Foundation

class Sword : Weapon {
    init () {
        super.init(name : "sword" , damagePoints: 20 )
    }
    
    var cure = 10
    func heal(){
        print("heal teammate from attack of fighter + \(cure) points")
    }
    
    override func attack() {
        print("attack with a sword")
        
        super.attack()
    }
    
}
let sword = Sword ()
