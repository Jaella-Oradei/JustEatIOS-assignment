
/*
 DECODING RESPOSNE FOR (API)
 - Struct Address
    > variable first_line of type string (optional) if it doesnt exist and not cfrash
    > variable city_name of type string(optional) just in case it doesnt exist and not crash
    > variable post_code of type string(option) just in case it doesnt aways exists and not crash
 
 */

struct Address: Decodable {
    let firstLine: String?
    let city: String?
    let postalCode: String?
}
