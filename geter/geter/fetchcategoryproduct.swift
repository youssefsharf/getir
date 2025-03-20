import SwiftUI
import Foundation


class CatViewModel: ObservableObject {
    @Published var catData: Cat?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchCatData() {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/product/getallproduct?databaseName=B202") else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received JSON: \(jsonString)")
                }
                
                do {
                    let decoder = JSONDecoder()
                    self?.catData = try decoder.decode(Cat.self, from: data)
                } catch let DecodingError.dataCorrupted(context) {
                    self?.errorMessage = "Data corrupted: \(context)"
                } catch let DecodingError.keyNotFound(key, context) {
                    self?.errorMessage = "Key '\(key)' not found: \(context.debugDescription)"
                } catch let DecodingError.valueNotFound(value, context) {
                    self?.errorMessage = "Value '\(value)' not found: \(context.debugDescription)"
                } catch let DecodingError.typeMismatch(type, context) {
                    self?.errorMessage = "Type '\(type)' mismatch: \(context.debugDescription)"
                } catch {
                    self?.errorMessage = "Failed to decode JSON: \(error.localizedDescription)"
                }
            }
        }
        
        task.resume()
    }
}
