
import Foundation

// Character class, parent class of all the characters

class Character {
    
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
        print("attack from \(name)","damage points with \(weapon.name)")
        opponent.lifePoints -= (weapon.damagePoints)
        print("\(opponent.name) looses \(weapon.damagePoints) pts")
        
    }
    
    
    func cure(target : Character){
        let curePoints = 10
        target.lifePoints += 10
        print("\(target.name) recovered \(curePoints)")
    }
       
    
    
    func characterIsAlive() -> Bool {
        if lifePoints > 80 {
            print ("\(name) is alive")
            return true
        } else {
            print("Your \(name) is dead, choose another character to fight")
            return false
        }
        
    }
    
    func displayLifepoints() {
        print("\(name) has \(lifePoints) life points")
              }
    
}


