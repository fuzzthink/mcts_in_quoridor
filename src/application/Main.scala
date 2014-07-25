package application

import games._
import games.players._
import testbed.parallelism._ // For testing purpose
import java.lang.Integer

object Main extends App {
  override def main(args:Array[String]) = {
    // constructor right here
    println("Welcome to mcts games")
        
    // receive arguments
    // 1. game {quoridor}
    // 2. agent1 {omc, uct, pbbm, ucb1}
    // 3. agent2 {...}    
    // 4. prefix of file path
    if (args.length != 8) {
      println("Missing argument! Sample: $scala main [1] [2] [2a] [3] [4] [5]")
      println("[1]: type of game. like: quoridor")
      println("[2]: number of iterations of player 1, like 100")
      println("[2a]: number of iterations of player 2, like 100")
      println("[3]: first agent type. Like: omc, pbbm, ucb1tuned, uct")
      println("[4]: second agent type. Like: omc, pbbm, ucb1tuned, uct")
      println("[6]: final move selection of agent 1")
      println("[7]: final move selection of agent 2")
      println("[8]: file path prefix. sample: /Users/abx/output/ . remember the / at the end")
    }
    else {
      val game:String =  args(0)
      val iteration1:Int = Integer.parseInt(args(1))
      val iteration2:Int = Integer.parseInt(args(2))
      var agent1:String = args(3)
      var agent2:String = args(4)
      val final1:String = args(5)
      val final2:String = args(6)
      val prefix:String = args(7)
      
      
      def selectGame(name:String): Any = game match {
        case "quoridor" => QuoridorGame.run(agent1, agent2, prefix, iteration1, iteration2, final1, final2)
        case "quoridorPar" => QuoridorGamePar.run(agent1, agent2, prefix, iteration1, iteration2, final1, final2)
        case _ => QuoridorGame.run(agent1, agent2, prefix, iteration1, iteration2, final1, final2)
      }
      
      selectGame(game)
    }
  }
  
}