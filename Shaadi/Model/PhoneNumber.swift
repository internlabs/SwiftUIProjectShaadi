import Foundation

//MARK: Define a struct called CPData which conforms to Codable and Identifiable protocols.
struct CPData: Codable, Identifiable {
    let id: String       //MARK: Unique identifier for the country data.
    let name: String     //MARK: Name of the country.
    let flag: String     //MARK: Flag representation of the country.
    let code: String     //MARK: Country code.
    let dial_code: String //MARK: Dial code for the country.
    let pattern: String  //MARK: Phone number pattern for the country.
    let limit: Int       //MARK: Limit for the phone number length.

    //MARK: Static property to hold all country data, decoded from a JSON file named "CountryNumbers.json".
    static let allCountry: [CPData] = Bundle.main.decode("CountryNumbers.json")
    
    //MARK: Static property to provide an example of CPData, using the first element from allCountry array.
    static let example = allCountry[0]
}

//MARK: Extend the Bundle class to include a method for decoding JSON files.
extension Bundle {
    //MARK: Generic method to decode a JSON file into a specified Decodable type.
    func decode<T: Decodable>(_ file: String) -> T {
        //MARK: Ensure the file URL exists in the bundle.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        //MARK: Attempt to read the data from the file URL.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        //MARK: Create a JSON decoder.
        let decoder = JSONDecoder()

        //MARK: Attempt to decode the data into the specified type.
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        //MARK: Return the decoded data.
        return loaded
    }
}
