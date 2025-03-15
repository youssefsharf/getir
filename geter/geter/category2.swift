import Foundation

// MARK: - Categoryproduct
struct Categoryproduct: Codable {
    let status: String
    let data: [Datum1]
}

// MARK: - Datum
struct Datum1: Codable {
    let id: Int
    let name: String
}
