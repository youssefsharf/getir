import SwiftUI
import Foundation

class CatViewModel: ObservableObject {
    @Published var catData: Cat?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchCatData(categoryId: String? = nil) {
        // إعادة تعيين البيانات القديمة
        self.catData = nil
        self.isLoading = true
        self.errorMessage = nil
        
        var urlString = "https://api2.smartinb.ai:8001/api/product/productLazy?databaseName=B202"
        
        if let categoryId = categoryId {
            urlString += "&category=\(categoryId)"
        }
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let catData = try decoder.decode(Cat.self, from: data)
                    self?.catData = catData
                } catch {
                    self?.errorMessage = "Failed to decode JSON: \(error.localizedDescription)"
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}

