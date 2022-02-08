
import Foundation

class Character {
    static let characters = [Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: ""), Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: "")]

    
    static var names :String = Character.names
    
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

  func characterIsAlive() -> Bool {
      while lifePoints > 0 { // faire un if  return un bool 
            print ("You are underattack, fight back")
        }
        return characterIsAlive()
    }
    
    func teamIsAlive() -> Bool {
        while characterIsAlive(),lifePoints > 0 {
            print("You can still win the fight, fight back")
        }
        return teamIsAlive()
    }

    func teamIsDead() -> Bool {
        while characterIsAlive (),lifePoints < 0 {
            print("All of your characters have no longer lifepoints left, you have lost the fight")
        }
        return teamIsDead()
    }
}


