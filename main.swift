//main class file for restaurant finder for just eat ios assigment


//import Foundation for accessing networks

import Foundation

//indicating to user that the program has started running and the restaurants are being searched.
print("Program has started...")
print("**************************************************")
print("Finding Restaurants for postcode EC3N 4DJ...")



//decoding the response (API)
/*
 - Struct API_Response
 
 
 - Struct Restaurant
 
 
 - Struct Cuisine
 
 
 
 - Struct Ratings
 
 
 - Struct Address
 
 
 
 */
struct API_Response: Decodable{
    let restaurant: [Restaurant]
}

struct Restaurant: Decodable{
    let name: String
    let cuisine: String
    let rating: Double
    let address: String
}


//finding restaurants from api




//printing top 10 restaurants with attributes (cusinine, rating & address)
