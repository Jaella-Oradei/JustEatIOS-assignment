import Foundation

class RestaurantFinder {
    
    func start() {
        print("\u{001B}[8;54;128t") //resizes terminal to run how desired
        //indentation for format and views of output to improve readbility of code.
        let indent_title = "                                                   "
        let spacing = "                                "
        print("\n\(indent_title)🛠️  Program has started... 🛠️\n")
        print("\(spacing)*********************************************************************** \n")//start of the program. for terminal only.
        print("\(indent_title) 🧾 Restaurants Finder 🧾 \n")
        
        //postcode of choice which restaurants are found from.
        let postal_code = "EC3N4DJ"
        
        
        //calling function that fetches restaurants from api endpoint
        fetching_Restaurants(postcode: postal_code) { (result) in
                //if the result is success, alphabetically order the results in asceding order and set constant variable information to be printed.
                switch result {
                case .success(let restaurants):
             
                    let alphabetical_order = restaurants.sorted {
                        $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending//ordering the results alphabetically
                    }
                    var output = ""
                    for (index, restaurant) in alphabetical_order.prefix(10).enumerated(){
                        //self.print_Restaurant(restaurant, index: index)
                        let infomation = self.print_Restaurant(restaurant, index: index)//calling function of printed results and passing variables index for counting and restaurant
                        print(infomation)//printing for temrinal too.
                        output += infomation + "\n"
                    }
                    
                    //saves the content that is now output by calling function that writes it into external .txt file
                    self.save_File(output, postcode: postal_code)//postcode is used to make unique file name and know which results are for what postcode.
                   
                    
                    print("\(spacing) ******************************************************************* \n")//improve visuals of printed information
                    
                    //if failed, print the error messave from localizedDescription
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
            print(" 🚫  Error Decoding: \(error)")
            completion(.failure(error))//however, if JSON doesnt match the swift format then it calls completion to failure and stops
        }
            
        }
        
        network_Task.resume()// allows for network task to begin running request or it doesnt work.
    }
    
    /*
    - retrieves the results of the attributes attached to each restaurant.
     - indentation variables(right_indent, middle_indent, left_indent) to clean up the spacing and improve readability
     
     */

    //printing top 10 restaurants with attributes (cusinine, rating & address)
    //creating a private function that returns a variable of type string
   private func print_Restaurant(_ restaurant: Restaurant, index: Int) -> String {
        
        
        //var postcode: String = ""
        let left_indent = "               "
        let middle_indent = "               "
        let right_indent = "                                    "
       
        let restaurant_Name = restaurant.name
        let cuisines_names = restaurant.cuisines.map {$0.name}.joined(separator: ", ")//each retrieved data for cuisine seperated by commas
        let restaurant_rating = restaurant.rating.starRating.map { String(format: "%.1f", $0) } ?? "N/A"
        let first_line = restaurant.address.firstLine ?? "N/A"//"N/A" if the result is nil, it doesnt crash
        let city_name = restaurant.address.city ?? "N/A"//"N/A" if the result is nil, it doesnt crash
        let postal_code = restaurant.address.postalCode ?? "N/A"//"N/A" if the result is nil, it doesnt crash
             
       //constant variable of the formatted output in both temrninal(console) and .txt file
       let information = """
        \(left_indent)    ╔═════════════════════════════════════════════════════════════════════════════════════════════╗
            \(middle_indent)║\(right_indent)🧾 Restaurant Info \(index + 1)\(right_indent) ║
            \(left_indent)╠═════════════════════════════════════════════════════════════════════════════════════════════╣
            \(left_indent)║ 🍽 Restaurant : \(restaurant_Name)
            \(left_indent)║ 🥘 Cuisine   : \(cuisines_names)
            \(left_indent)║ 🌟 Rating    : \(restaurant_rating)
            \(left_indent)║ 📍 Address   : \(first_line) \(city_name) \(postal_code)
            \(left_indent)╚═════════════════════════════════════════════════════════════════════════════════════════════╝\n
        """

       return information//returns information
    }

    //saving results to .txt file. requires postcode for the making it unique file name based on postcode for user to know which postcode had which results.
    /*
     - Saves the restaurants results that comes from the passed parameter "output" and uniquely saves tp .txt file.
        - parameters:
            >output: a String type variable that is going to be written to the .txt file
            >postcode: the postcode that will be provided for where to fetch restaurant details from to know which postr
     
     */
    func save_File(_ output: String, postcode: String) {

        //creates a date time format to create a unique timestamp
        let date_format = DateFormatter()
        date_format.dateFormat = "yyyy-MM-dd_HH-mm-ss"//
        let date_time = date_format.string(from: Date())
        
        //creating a dynamic filename using the postcode and timestamp
        let file_name = "Restaurant_Finder_\(postcode)_\(date_time).txt"
        
        //defining the destination path of the file in desktop.
        let save_in_Folder = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
        let file_URL = save_in_Folder.appendingPathComponent(file_name)//saving file to directory path
        
        //writing the output to the specified file name.
        do {
            try output.write(to: file_URL, atomically: true, encoding: .utf8)
            print( "\n 🧾 Restaurant results are also saved to file: \(file_URL.path)\n")//lets user know where to find saved .txt file.
            //handling errors that can occfur when writing to the file.
        } catch {
                    print("❌ Couldn't write the contents to the .txt. file.")
            }
    }
 

}
