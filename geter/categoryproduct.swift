import SwiftUI
import Foundation

// MARK: - نموذج البيانات
struct Cat: Codable {
    let data: [CatDatum]
    let results: Int
    let status: String
}

struct CatDatum: Codable {
    let ecommercePriceBeforeTax: Double
    let featured: Bool
    let value2, suppliers: [AnyCodable]
    let alternateProducts: [String]
    let type: TypeEnum
    let createdAt, shortDescriptionAR: String
    let price: Double
    let v: Int
    let datumID, sku, descriptionTR: String
    let slug: String?
    let profitRatio: Double?
    let height: Int
    let updatedAt: String
    let metas: Metas
    let qr: String?
    let additionalInfo: AdditionalInfo
    let weight: Double
    let tax: Tax
    let shortDescription: ShortDescription
    let sync: Bool
    let addToFavourites, priceAftereDiscount: Int
    let unit: Unit?
    let imagesArray: [ImagesArray]
    let ecommercePriceMainCurrency: Double
    let name, id: String
    let customAttributes: [CustomAttribute]
    let archives: String
    let nameAR: NameAR
    let description, descriptionAR: String
    let buyingprice, ratingsAverage: Double
    let stocks: [Stock]
    let soldByWeek: Int?
    let parasutID: String
    let alarm, addToCart: Int
    let currency: Currency
    let soldByMonth: Int?
    let shortDescriptionTR: String
    let value: [AnyCodable]
    let productNo: Int?
    let sold, quantity, ecommercePriceAftereDiscount, length: Int
    let sponsored: Bool
    let ratingsQuantity: Int
    let ecommercePrice: Double
    let nameTR: String
    let publish: Bool
    let width: Int
    let taxPrice: Double
    let ecommerceActive: Bool
    let importDate, density: String?
    let category: CatCategory?
    let brand: String?
}

// MARK: - تعريف الأنواع الأخرى
enum AdditionalInfo: String, Codable {
    case additionalInfo = "AdditionalInfo"
}

enum CatCategory: String, Codable {
    case the67Bd7B2Ce1D73Ac9906062A1 = "67bd7b2ce1d73ac9906062a1"
    case the67Bd7B4De1D73Ac9906062A7 = "67bd7b4de1d73ac9906062a7"
    case the67Bd7B8Ce1D73Ac9906062C3 = "67bd7b8ce1d73ac9906062c3"
    case the67Bd7Ba8E1D73Ac9906062CA = "67bd7ba8e1d73ac9906062ca"
    case the67Bd7C05E1D73Ac9906062Df = "67bd7c05e1d73ac9906062df"
    case the67Bd7C54E1D73Ac99060631B = "67bd7c54e1d73ac99060631b"
    case the67Bd7C6Be1D73Ac990606322 = "67bd7c6be1d73ac990606322"
    case the67Bd7C92E1D73Ac990606329 = "67bd7c92e1d73ac990606329"
    case the67Bd7Cb1E1D73Ac990606330 = "67bd7cb1e1d73ac990606330"
    case the67Bd7Ce4E1D73Ac990606337 = "67bd7ce4e1d73ac990606337"
    case the67Bd7D0De1D73Ac99060633E = "67bd7d0de1d73ac99060633e"
    case the67C6B5Bf27Bcf07Ef6Cc4140 = "67c6b5bf27bcf07ef6cc4140"
    case the67Cacee0E9B92C6338053Fb7 = "67cacee0e9b92c6338053fb7"
}

struct Currency: Codable {
    let currencyName: CurrencyName
    let isPrimary: String
    let exchangeRate: Double
    let id: ID
    let currencyCode: CurrencyCode
}

enum CurrencyCode: String, Codable {
    case currencyCode = "CurrencyCode"
    case empty = ""
}

enum CurrencyName: String, Codable {
    case trl = "TRL"
    case usd = "USD"
}

enum ID: String, Codable {
    case the67Bd7864E1D73Ac990606201 = "67bd7864e1d73ac990606201"
    case the67Bd82Fee1D73Ac990606459 = "67bd82fee1d73ac990606459"
}

struct CustomAttribute: Codable {
    let value, key: String
}

struct ImagesArray: Codable {
    let image: String
    let isCover: Bool
}

struct Metas: Codable {
    let keywords: Keywords
    let description, title: Description
}

struct Description: Codable {
    let ar: String
    let en: En
    let tr: String
}

enum En: String, Codable {
    case empty = ""
    case lenovoLecooM1102OptikKabloluMouseFiyatları = "Lenovo Lecoo M1102 Optik Kablolu Mouse Fiyatları"
}

struct Keywords: Codable {
    let ar, en, tr: [AnyCodable]
}

enum NameAR: String, Codable {
    case empty = ""
    case nameAR = "NameAR"
    case zkTecoSF300قارئبصماتالأصابع = "ZK Teco SF300 قارئ بصمات الأصابع"
}

enum ShortDescription: String, Codable {
    case productShortDescription = "ProductShortDescription"
}

struct Stock: Codable {
    let productQuantity: Double
    let stockName: StockName
    let stockID: StockID
}

enum StockID: String, Codable {
    case the67Bd7863E1D73Ac9906061F9 = "67bd7863e1d73ac9906061f9"
}

enum StockName: String, Codable {
    case mainStcok = "MainStcok"
}

enum Tax: String, Codable {
    case the67Bd7E39E1D73Ac99060635F = "67bd7e39e1d73ac99060635f"
    case the67Bd7E45E1D73Ac990606373 = "67bd7e45e1d73ac990606373"
}

enum TypeEnum: String, Codable {
    case normal = "normal"
}

enum Unit: String, Codable {
    case the67Bd7Ea2E1D73Ac9906063C0 = "67bd7ea2e1d73ac9906063c0"
    case the67Bd7Ea9E1D73Ac9906063C7 = "67bd7ea9e1d73ac9906063c7"
    case the67Bd7Eb3E1D73Ac9906063Ce = "67bd7eb3e1d73ac9906063ce"
}

// MARK: - AnyCodable للتعامل مع القيم التي قد تكون من أي نوع
struct AnyCodable: Codable {}

// MARK: - ViewModel لجلب البيانات
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
                
                // طباعة البيانات الخام لفحصها
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received JSON: \(jsonString)")
                }
                
                do {
                    let decoder = JSONDecoder()
                    self?.catData = try decoder.decode(Cat.self, from: data)
                } catch {
                    self?.errorMessage = "Failed to decode JSON: \(error.localizedDescription)"
                    print("Decoding error: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

// MARK: - واجهة المستخدم باستخدام SwiftUI
struct ProductView: View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else if let catData = viewModel.catData {
                    List(catData.data, id: \.id) { catDatum in
                        VStack(alignment: .leading) {
                            Text(catDatum.name)
                                .font(.headline)
                            Text("Price: \(catDatum.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                    .navigationTitle("Products")
                } else {
                    Text("No data available")
                }
            }
            .onAppear {
                viewModel.fetchCatData()
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
} 
