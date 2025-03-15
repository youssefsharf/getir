import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [Datum1] = [] // تم تغيير CategoryData إلى Datum
    private var cancellables = Set<AnyCancellable>()
    
    func fetchCategories() {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/product/getallproduct?databaseName=B202") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Categoryproduct.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching categories: \(error)")
                }
            }, receiveValue: { [weak self] categoryProduct in
                self?.categories = categoryProduct.data // تحديث القائمة بالبيانات الجديدة
            })
            .store(in: &cancellables)
    }
}
