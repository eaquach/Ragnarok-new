
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String
    var characters = [Character]()
    let maxCharacterTeamPlayer = 3
    init(playerName:String){
        self.playerName = playerName
    }
    
    static func isNameAlreadyTaken(name:String) -> Bool {
        return false
    }
    func setName(name:String) -> Bool {
        return false
    }
    static func createPlayer() -> Player {
        print("Choose a name for your player")
    
        while let playerName = readLine() {
            let player = Player(playerName: playerName)
        
            let character = player.createCharacter()
            player.characters.append(character)
            return player
        }
        return Player(playerName: "unknown")
    }
        
    func pickAWeapon() -> Weapon {
        print("""
        Select a weapon from the following list, by pressing the associated number:
        """)

        for (index, weapon) in Weapon.weapons.enumerated() {
            print("Item \(index): \(weapon.name)")
        }

        if let indexValue = readLine(),
        let choice = Int(indexValue),
           choice >= 0,
           choice < Weapon.weapons.count {
            let weapon =  Weapon.weapons[choice]

            print  ("Your weapon is \(weapon.name)")
            return weapon
        } else {
            print ("wrong choice")
            return pickAWeapon()
        }

    }
    func createCharacter() -> Character {

        print ("Enter a name for your character")
        if let nameValue = readLine() {
            let weapon = pickAWeapon()
            return Character(weapon: weapon, name: nameValue)

        } else {
            print ("wrong choice")
            return createCharacter()
        }
    }
    
   


    }
    
    
    
    
    
    
    
    
//    func createTeam () {
//        
//        //              enter your first character name, then your second character and finally your last character and pick a name for your 3 characters
//        
//        while let characterName = readLine(), characters.count < maxCharacterTeamPlayer, !isNameAlreadyTaken(name: characterName) {
//            let weapon = Weapon.weapons.randomElement()
//            let character = Character(weapon:weapon!, name: characterName)
//            characters.append(character)
//            
//            if characterName == characterName, characters.count < maxCharacterTeamPlayer {
//                print("Your character is \(characterName), you can choose a name for your next character")
//            } else if characters.count == maxCharacterTeamPlayer {
//                print ("Your character is \(characterName),congratulations, your team is finally complete, we will start the first battle")
//            }
//            //            switch choice {
            //            case ["1"]:
            //                print("you choose the fighter")
            //
            //            case ["2"]:
            //                print("you choose the adventurer")
            //
            //            case ["3"]:
            //                print("you choose the witch")
            //
            //            default:
            //                print("you have to press a number between 1 and 3 to create your team")
            //
            //            }
            
//        }
//    }
    func startFight()  {
        // à compléter: trouver la logique de combat avec une boucle, ne pas oublier d'intégrer le coffre aléatoire (random)
    }
//}

