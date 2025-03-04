import Foundation
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchCategories() {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/category?databaseName=noontek_gaziantep") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        self.isLoading = true
        self.errorMessage = nil
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "No data received"
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let categories = try decoder.decode([Category].self, from: data)
                    self.categories = categories
                } catch {
                    print("Failed to decode JSON: \(error)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}
