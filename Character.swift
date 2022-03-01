
import Foundation

// Character class, parent class of all the characters

class Character {
    //    static let characters = [Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: ""), Character(weapon: axe, name: ""), Character(weapon: bowArrow, name: ""), Character(weapon: sword, name: "")]
    
    
    static var names = [String]()
    
    //    settings of all characters
    var character : Character
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
    
    
//    func cure(target : Character){
//        var curePoints = 10
//        Character.cure
//       
    
    
    //    func cure(){
    //        if
    //
    //
    
    static func characterIsAlive(Character: Int) -> Bool {
        let ptsLife = Character.self
        if ptsLife <= 10 {
            print ("You are underattack, fight back")
        } else {
            print("Your \(Character) is dead, choose another to fight")
        }
        return Character()
    }
    
    
}


