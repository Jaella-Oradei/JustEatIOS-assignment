
/*
 DECODING RESPOSNE FOR (API)
 - Struct API_Response
  > restaurant of type Restaurant array as there will be more than oen restaurant
 */

struct API_Response: Decodable {
    let restaurants: [Restaurant] //array of restaurants
}
