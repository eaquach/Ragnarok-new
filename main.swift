
import Foundation

class Game {
    var playerOne : Player
    var playerTwo : Player
    var currentPlayer: Player
    
    init() {
        self.playerOne = Game.createPlayerOne() //1
        self.playerTwo = Game.createPlayerTwo() //2
        currentPlayer = playerOne
    }
    
    func setCurrentPlayer() {
        currentPlayer = currentPlayer == playerOne ? playerTwo : playerOne
    }
    
//    static func isNameAlreadyTaken(name:String) -> Bool {
//        return false
//    }
//    
//    func setName(name:String) -> Bool {
//        return false
//    }
    
//    static func createPlayer() -> Player {
//        print("Choose a name for your player")
//    
//        while let playerName = readLine(), !isNameAlreadyTaken(name: playerName) {
//           let player = Player(playerName: playerName)
//            
//           let characterName = readLine(), characters.count < maxCharacterTeamPlayer, !isNameAlreadyTaken(name: characterName) {
//            let character = player.createCharacter()
//            player.characters.append(character)
//            return player
//        }
//        return Player(playerName: "unknown")
//
//
//    }
//    créer une boucle
//    let weapon = player.pickAWeapon()
//    let character = player.createCharacter(weapon: weapon)
//    player.characters.append(character)
//    return player
    
    
    func welcomeGameMessage() {
        print("""
              Hello warrior, welcome to the combat ring!
              Congratulations, you have your entire team!
              We can now start our first fight.
              Let's go!
              """)
//        please select three characters for your team, each character has 100 life points
//
       
        playerOne.createTeam()
        playerTwo.createTeam()

    }
    
}

let game = Game()
game.welcomeGameMessage()
game.setCurrentPlayer()









// create your team, choice of 3 characters



