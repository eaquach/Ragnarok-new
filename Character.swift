
import Foundation

// Character class, parent class of all the characters

class Character {
//    static let characters = [Character(weapon: axe, name: "", damage: 0), Character(weapon: bowArrow, name: "", damage: 0), Character(weapon: sword, name: "", damage: 0), Character(weapon: axe, name: "", damage: 0), Character(weapon: bowArrow, name: "", damage: 0), Character(weapon: sword, name: "",damage: 0),]
    
    
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
    
    
    
    func cure(){
        if 

    
    
    func characterIsAlive() -> Bool {
        if lifePoints > 0 { // faire un if  return un bool
            print ("You are underattack, fight back")
        }
        return true
    }
    
    
    
    
    
    
    func teamIsDead() -> Bool {
        while characterIsAlive (),lifePoints < 0 {
            print("All of your characters have no longer lifepoints left, you have lost the fight")
        }
        return true
    }
}


