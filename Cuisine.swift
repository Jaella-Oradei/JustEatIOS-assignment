
/*
 DECODING RESPOSNE FOR (API)
 - Struct Cuisine
    > constant variable cusine_name of type string that is immutable
 
 */
struct Cuisine: Decodable {
    let name: String //must keep variables same as JSON
}
