
import Foundation

// Character class, parent class of all the characters

class Character {
    //    static let characters = [Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: ""), Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: "")]
    
    
    static var names = [String]()
    
    //    settings of all characters
    var name:String
    var lifePoints = 100
    var weapon : Weapon
    let maxCharacterTeam = 3
    init(weapon: Weapon, name: String) {
        self.weapon = weapon
        self.name = name
    }
    
    
    
    
    
    func attack(opponent : Character) {
        
        //        print("attack from \(name)", String (points) , "damage points with\(name)")
        //
        opponent.lifePoints -= (weapon.damagePoints)
        print("\(opponent.name) looses \(weapon.damagePoints) pts")
        
    }
    
    
    
    //    func cure(){
    //        if
    //
    //
    
    func characterIsAlive(lifePoints:Int) -> Bool {
        let ptsLife = lifePoints.self
        if ptsLife <= 0 {
            print ("You are underattack, fight back")
        } else {
            print("Your \(self.name) is dead, choose another to fight")
        }
        return true
    }
    
    
    
    
//    func teamIsDead() -> Bool {
//        while characterIsAlive {
//            print("All of your characters have no longer lifepoints left, you have lost the fight")
//        }
//        return true
//    }
}


