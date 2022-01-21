
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
    
    func characterNameIsTaken(name:Character) -> Bool {
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
//    
//    func pickAWeapon() -> Weapon {
//        print("""
//              Select a weapon from the following list:
//   
//              """)
//        
//        for (index, weapon) in Weapon.weapons.enumerated() {
//            print("Item \(index): \(weapon.name)")
//        }
//        
//        if let indexValue = readLine(),
//           let choice = Int(indexValue),
//           choice >= 0,
//           choice < Weapon.weapons.count {
//            let weapon =  Weapon.weapons[choice]
//            
//            print  ("Your weapon is \(weapon.name)")
//            return weapon
//        } else {
//            print ("wrong choice")
//            return pickAWeapon()
//        }
        
//        func createCharacter() -> Character {
//            print ("name character")
//            if let nameValue = readLine() {
//                let weapon = pickAWeapon()
//                return Character(weapon: weapon, name: nameValue)
//                
//            } else {
//                print ("wrong choice")
//                return createCharacter()
//            }
//        }
        
//    }
}
