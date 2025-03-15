
import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchCategories(completion: @escaping (Result<Category, Error>) -> Void) {
        let urlString = "https://api2.smartinb.ai:8001/api/category?databaseName=noontek_gaziantep"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode(Category.self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
