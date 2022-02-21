
import Foundation

// Character class, parent class of all the characters

class Character {
    static let characters = [Character(weapon: axe, name: "", damage: 0), Character(weapon: bowArrow, name: "", damage: 0), Character(weapon: sword, name: "", damage: 0), Character(weapon: axe, name: "", damage: 0), Character(weapon: bowArrow, name: "", damage: 0), Character(weapon: sword, name: "",damage: 0),]
    
    
    static var names = [String]()
    
    //    settings of all characters
    var name:String
    var lifePoints = 100
    var damage : Int
//    var isPlayerOneTurn : Bool
    
    //    var opponent : Character => essaye de dire que le character peut etre celui de la team opposé
    var weapon : Weapon?
    let maxCharacterTeam = 3
    init(weapon: Weapon, name: String, damage : Int) {
        self.weapon = weapon
        self.name = name
        self.damage = damage
    }
    
    
//   static func pickACharacter() -> Character {
//        var fighter : Character
//        var playerChoice = ""
//        repeat {
//            if let choice = readLine() {
//                playerChoice = choice
//            }
//            
//        } while playerChoice != "1" && playerChoice != "2" && playerChoice != "3"
//        
//        switch playerChoice {
//        case "1":
//            print("You choose\(Character.names) as the fighter")
//            fighter = Character.characters[0]
//            
//        case "2":
//            print("You choose\(Character.names) as the fighter")
//            fighter = Character.characters[1]
//            
//        case "3":
//            print("You choose\(Character.names) as the fighter")
//            fighter = Character.characters[2]
//            
//        default:
//            fighter = Character.characters[0]
//        }
//        return fighter
//    }
    
    ////        self.opponent = Character. n'arrive pas à le déclarer
    //    }
    //
    ////    func setCurrentPlayer() {
    ////        currentPlayer = currentPlayer == playerOne ? playerTwo : playerOne
    ////    }
    
    
    
    func attack(opponent : Character) {
        _ = weapon?.damagePoints
        _ = weapon
//        print("attack from \(name)", String (points) , "damage points with\(name)")
//
        if let characterWeapon = weapon {
            opponent.lifePoints = opponent.lifePoints - (damage  + characterWeapon.damagePoints)
            print("\(opponent.name) looses \(damage) pts")
                  } else {
                opponent.lifePoints = opponent.lifePoints - damage
                print("\(opponent.name) looses \(damage) pts")
        }
    }
    
    
    
    
//    func underAttack () { utilité de la fonction ?
//        print ("attack received by \(name) +\(weapon?.damagePoints ?? )")
//    }
    
    
    
    func characterIsAlive() -> Bool {
        if lifePoints > 0 { // faire un if  return un bool
            print ("You are underattack, fight back")
        }
        return true
    }
    
    
    
    func teamIsAlive() -> Bool {
        while characterIsAlive(),lifePoints > 0 {
            print("You can still win the fight, fight back")
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


