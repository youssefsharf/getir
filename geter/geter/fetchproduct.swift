import SwiftUI
import Combine

class CategoryViewModel2: ObservableObject {
    @Published var categories: [Welcome] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchCategories() {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/product/getallproduct?databaseName=B202") else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Welcome].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("Decoding error: \(error)") // طباعة الخطأ بالتفصيل
                }
            }, receiveValue: { [weak self] categories in
                self?.categories = categories
                print("Fetched categories: \(categories)") // طباعة البيانات المستلمة
            })
            .store(in: &cancellables)
    }
}
