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
  > restaurant of type Restaurant array as there will be more than oen restaurant
 
 - Struct Restaurant
    > variable name of type string
    > variable cuisines of type Cuisine in array format as there will be multiple cuisines
    > variable rating of type Ratings
    > variable address of type Address
 
 - Struct Cuisine
    > variable cusine_name of type string
 
 - Struct Ratings
    > variable rating_number of type
 
 - Struct Address
    > variable first_line of type string (optional) if it doesnt exist and not cfrash
    > variable city_name of type string(optional) just in case it doesnt exist and not crash
    > variable post_code of type string(option) just in case it doesnt aways exists and not crash
 
 */

struct API_Response: Decodable {
    let restaurant: [Restaurant] //array of restaurants
}

struct Restaurant: Decodable {
    let name: String
    let cuisines: [Cuisine]//array of cuisines
    let rating: Rating
    let address: Address
}

struct Cuisine: Decodable {
    let cuisine_name: String
}

struct Rating: Decodable {
    let rating_number: Double?//'?' optional if doesnt exist so no crashing
}

struct Address: Decodable {
    let first_line: String?
    let city_name: String?
    let post_code: String?
}


//finding restaurants from api and fetching them
func fetching_Restaurants(postcode: String, completion: @escaping Result<[Restaurant], Error) -> Void) {
    let url_string = "https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/\(postcode)"
    guard let url = URL(string: url_string)
        return
    }





//printing top 10 restaurants with attributes (cusinine, rating & address)
