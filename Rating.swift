
/*
 DECODING RESPOSNE FOR (API)
 - Struct Ratings
    > variable rating_number of type
 
 */

struct Rating: Decodable {
    let starRating: Double?//'?' optional if doesnt exist so no crashing
}
