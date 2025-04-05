//main class file for restaurant finder for just eat ios assigment. the runner file

import Foundation
//function called main that creates instance of the RestaurantFinder class as finder.
    //- finder is then calling the start function method from that class which has all the fucntionality of the program
func main() {
    let finder = RestaurantFinder()
    finder.start()
}

//calling the main function which activates it to run everything
main()
RunLoop.main.run()//runs the program in loop.
