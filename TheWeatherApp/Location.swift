import Foundation

struct CitiesStruct: Decodable {
    
    let country: String
    let name: String
    let lat: String
    let lng: String

}

class ParseJson {
    
    static let shared = ParseJson()
    var cities: [CitiesStruct] = []
    
    func jsonVanila() {
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do {
            cities = try JSONDecoder().decode([CitiesStruct].self, from: data! as Data)
        } catch let jsonError {
            print(jsonError)
        }
    }
    
}
