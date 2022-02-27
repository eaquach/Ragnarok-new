
// create your team, choice of 3 characters
import Foundation

class Player: NSObject {
    var playerName : String
    var characters = [Character]()
    let maxCharacterTeamPlayer = 3
    init(playerName:String) {
        self.playerName = playerName
    }
    
    
    
    func isNameAlreadyTaken(name:String) -> Bool {
        let contains = Character.names.contains(name)
        if !contains {
            Character.names.append(name)
        }
        
        return contains
    }
    
    
    
    func setName(name:String) -> Bool {
        return false
    }
    
    
    
    static func createPlayer() -> Player {
        print("Choose a name for your player")
        
        while let playerName = readLine() {
            let player = Player(playerName: playerName)
            player.createCharacters()
            return player
        }
        return Player(playerName: "unknown")
    }
    
    
    
    func createCharacters() {
        while characters.count < maxCharacterTeamPlayer {
            let character = createCharacter()
            characters.append(character)
        }
        
    }
    
    // while the 3 characters are not created, repeat the code
    
    
    func createCharacter() -> Character {
        print ("Enter a name for your character")
        if let nameValue = readLine(), !isNameAlreadyTaken(name: nameValue){
            let weapon = pickAWeapon()
            return Character(weapon: weapon,name: nameValue)
        } else {
            print ("This name is already taken, choose another name")
        }
        return createCharacter()
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
    
    
    func pickAFighter() -> Character {
        var fighter : Character
        var characterChoice = ""
        repeat {
            if let choice = readLine() {
                characterChoice = choice
            }
            
        } while characterChoice != "1" && characterChoice != "2" && characterChoice != "3"
        
        switch characterChoice {
        case "1":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[0]
            
        case "2":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[1]
            
        case "3":
            print("You choose\(Character.names) as the fighter")
            fighter = self.characters[2]
            
        default:
            fighter = self.characters[0]
        }
        return fighter
    }
    
    
    
    func playerIsAlive() -> Bool {
        if Character.characterIsAlive(Character)
                print("You can still win the fight, fight back")
            } else {
             print("Your character is dead, choose another character to fight")
            }
        }
    }
    
    
//La boucle de tour par tour doit tenir compte d'une "inversion" entre les player: à chaque tour, le player opponent devient le currentPlayer et vice versa
//Bien faire attention à la syntaxe et aux nomenclatures: un type commence par une majuscule, une variable ou constante par une minuscule. Bien indenter son code pour une lecture plus aisée.
//
    //   print (
    //        """
    //        Choose a character from your team to start the first battle \
    //        \press 1 for your first character to be the fighter \
    //        press 2 for your second character to be the fighter \
    //        press 3 for your third character to be the fighter \
    //        """
    //   )
    
    
    
    //    func playerIsAlive() -> Bool {
    //        while ==    < 0
    //                print("Continue the fight")
    //    }
    //    return playerIsAlive()
   }



