import Foundation

// MARK: - Category
struct Category: Codable {
    let status: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let _id, name: String
    let __v: Int?
    let image: String?
    let nameAR, nameTR: String?
    let profitRatio: Int?
    let children: [Datum]?
    let parentCategory: String?

    enum CodingKeys: String, CodingKey {
        case _id, name, __v, image
        case nameAR = "nameAR"
        case nameTR = "nameTR"
        case profitRatio = "profitRatio"
        case children
        case parentCategory = "parentCategory"
    }
}

