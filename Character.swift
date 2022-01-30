
import Foundation

class Character {
    static let characters = [Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: ""), Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: "")]
  
    var name:String
    var lifePoints = 100
    var fight : Int = 0
    
    var weapon : Weapon
    let maxCharacterTeam = 3
    init(weapon: Weapon, name: String) {
        self.weapon = weapon
        self.name = name
    }
    
    static func characterNameIsTaken(name:Character) -> Bool {
        return false
        
    }
    func attack(){
        let points = weapon.damagePoints
        let name = weapon
        
        print("attack from \(name)", String (points) , "damage points with\(name)")
    }
    
    func underAttack () {
        print ("attack received by \(name) +\(weapon.damagePoints)")
    }


}
