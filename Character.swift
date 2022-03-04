
import Foundation

// Character class, parent class of all the characters

class Character {
    
    static var names = [String]()
    
    //    settings of all characters
//    var character : Character
    var name:String
    var lifePoints = 100
    var weapon : Weapon
    let maxCharacterTeam = 3
    init(weapon: Weapon, name: String) {
        self.weapon = weapon
        self.name = name
    }
    
    
    
    func attack(opponent : Character) {
        print("attack from \(name)","damage points with\(name)")
        opponent.lifePoints -= (weapon.damagePoints)
        print("\(opponent.name) looses \(weapon.damagePoints) pts")
        
    }
    
    
    func cure(target : Character){
        let curePoints = 10
        target.lifePoints += 10
        print("\(target.name) recovered \(curePoints)")
    }
       
    
    
    func characterIsAlive() -> Bool {
        
        if lifePoints > 0 {
            print ("You are underattack, fight back")
            return true
        } else {
            print("Your \(name) is dead, choose another to fight")
            return false
        }
        
    }
    
    
}


