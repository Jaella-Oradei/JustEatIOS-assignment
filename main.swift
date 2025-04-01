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
    let restaurant: [Restaurant] //array of restaurants
}

struct Restaurant: Decodable{
    let name: String
    let cuisines: [Cuisine]//array of cuisines
    let rating: Rating
    let address: Address
}

struct Cuisine: Decodable{
    let cuisine_name: String
}

struct Rating: Decodable{
    let rating_number: Double?//'?' optional if doesnt exist so no crashing
}

struct Address: Decodable{
    let first_line = String?
    let city_name = String?
    let post_code = String?
}


//finding restaurants from api




//printing top 10 restaurants with attributes (cusinine, rating & address)
