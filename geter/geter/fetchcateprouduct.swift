import Foundation
import Combine

class CateViewModel: ObservableObject {
    @Published var catData: Cate?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var selectedChildren: [String] = []

    func fetchCatData() {
        isLoading = true
        errorMessage = nil

        fetchCategories { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    self.catData = data
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func fetchChildren(for category: Datum2) {
        selectedChildren = category.children
    }

    private func fetchCategories(completion: @escaping (Result<Cate, Error>) -> Void) {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/category?databaseName=B202") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode(Cate.self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
