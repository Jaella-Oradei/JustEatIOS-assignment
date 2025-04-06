//main class file for restaurant finder for just eat ios assigment. the runner file

import Foundation
//function called main that creates instance of the RestaurantFinder class as finder.
    //- finder is then calling the start function method from that class which has all the fucntionality of the program
func main() {
    print("\u{001B}[8;54;128t")//resizes terminal to run how desired
    //indentation for format and views of output to improve readbility of code.
    //indentation for format and views of output to improve readbility of code.
    let indent_title = "                                                   "
    let spacing = "                                "
    //program header displey
    print("\n\(indent_title)🛠️  Program has started... 🛠️\n")
    print("\(spacing)*********************************************************************** \n")//start of the program. for terminal only.
    
    print("\(indent_title) 🧾 Restaurants Finder 🧾 \n")
    let finder = RestaurantFinder()
    let first_Postcode = finder.prompt_User("\n❔ Please Enter a UK Postcode to find restaurants ")
    finder.start(postal_code: first_Postcode)
}

//calling the main function which activates it to run everything
main()
RunLoop.main.run()//runs the program in loop.
