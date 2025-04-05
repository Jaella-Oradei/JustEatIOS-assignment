import Foundation

class RestaurantFinder {
    
    func start() {
        print()
        print("                                                         🛠️  Program has started... 🛠️\n")
        print("                                *********************************************************************** \n")
        print("                                                          🧾 Restaurants Finder 🧾 \n")
        
        //postcode of choice.
        let postal_code = "EC3N4DJ"
        
        //calling function that fetching restauranta from api endpoint
        fetching_Restaurants(postcode: postal_code) { (result) in
                
                switch result {
                case .success(let restaurants):
             
                    for (index, restaurant) in restaurants.prefix(10).enumerated(){
                        self.print_Restaurant(restaurant, index: index)
                    }
                   
                    print("                                  ******************************************************************** \n")
                    
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            CFRunLoopStop(CFRunLoopGetCurrent())
            }
        
    }
    
    func fetching_Restaurants(postcode: String, completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        let url_string = "https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/\(postcode)"// url link path being set as url_string
        guard let url = URL(string: url_string) else {//trying to create valid url object from url_string given.
            let URL_Error = NSError(domain: "🚫 Error URL Domain", code: 01, userInfo: [NSLocalizedDescriptionKey: "URL: \(url_string) not valid."])// if url_string is not valid, outout error message(custom) with NSError function. Code: 0 as first error message
            completion(.failure(URL_Error))//completion closure with a failure result as url not valid
            return//exit function
        }
        
        //creating network task
        let network_Task = URLSession.shared.dataTask(with: url){data, response, error in//closure will response in format of data, response, error in.. when ran
            if let task_Error = error {
                completion(.failure(task_Error))//checks if error happened, if not, continue, if yes, completion goes into failure and ends.
                return
            }
            
           //retrieving data from the server
            guard let raw_Data = data else {
                let data_Error = NSError(domain: "Error Session Data", code: 02, userInfo: [NSLocalizedFailureErrorKey: "❌ Data was not recived unfortunately, Please check JSON formatting"])// if the data is not present, error message with NSError and error code token 02 as its seconf error message- used NSLocalizedFailureErrorKey for more description on error
                completion(.failure(data_Error))//calls to completion of failure then stops running
                return
            }
            //decoding the raw JSON data into the custom swift type which is set up in API_Response
        do{
            let response_Decoded = try JSONDecoder().decode(API_Response.self, from: raw_Data)
            //self.print_Restaurant(response_Decoded.restaurants, index: <#T##Int#>)
                completion(.success(response_Decoded.restaurants))//if all goes well, comletion is a success, sends it back into the format of the response_decoded.
                
        }catch{
            print("Error Decoding: \(error)")
            completion(.failure(error))//however, if JSON doesnt match the swift format then it calls completion to failure and stops
        }
            
        }
        
        network_Task.resume()// allows for network task to begin running request or it doesnt work.
    }

    //printing top 10 restaurants with attributes (cusinine, rating & address)
    
  

   private func print_Restaurant(_ restaurant: Restaurant, index: Int){
        
        
        //var postcode: String = ""
        let left_indent = "               "
        let middle_indent = "               "
        let right_indent = "                                     "
       
        let restaurant_Name = restaurant.name
        let cuisines_names = restaurant.cuisines.map {$0.name}.joined(separator: ", ")
        let restaurant_rating = restaurant.rating.starRating.map { String(format: "%.1f", $0) } ?? "N/A"
        let first_line = restaurant.address.firstLine ?? "N/A"
        let city_name = restaurant.address.city ?? "N/A"
        let postal_code = restaurant.address.postalCode ?? "N/A"
                                                                      

        print(left_indent,"╔═════════════════════════════════════════════════════════════════════════════════════════════╗")
        print(middle_indent,"║\(right_indent)🧾 Restaurant Info \(index + 1)\(right_indent) ║")
        print(left_indent,"╠═════════════════════════════════════════════════════════════════════════════════════════════╣")
        print(left_indent,"║ 🍽 Restaurant : \(restaurant_Name)")
        print(left_indent,"║ 🥘 Cuisine   : \(cuisines_names)")
        print(left_indent,"║ 🌟 Rating    : \(restaurant_rating)")
        print(left_indent,"║ 📍 Address   : \(first_line)\(city_name)\(postal_code)")
        print(left_indent,"╚═════════════════════════════════════════════════════════════════════════════════════════════╝\n")
    }

/*    //let formatter
fetching_Restaurants(postcode: postcode) { (result) in
        
        switch result {
        case .success(let restaurants):
     
            for (index, restaurant) in restaurants.prefix(10).enumerated(){
                print_Restaurant(restaurant, index: index)
            }
           
            print("                            ******************************************************************** \n")
            
        case .failure(let error):
            print("Error \(error.localizedDescription)")
        }
    }
*/
}

