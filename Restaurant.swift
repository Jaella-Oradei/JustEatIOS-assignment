
/*
 DECODING RESPOSNE FOR (API)
 - Struct Restaurant
    > variable name of type string
    > variable cuisines of type Cuisine in array format as there will be multiple cuisines
    > variable rating of type Ratings
    > variable address of type Address

 */

struct Restaurant: Decodable {
    let name: String
    let cuisines: [Cuisine]//array of cuisines
    let rating: Rating
    let address: Address
}
