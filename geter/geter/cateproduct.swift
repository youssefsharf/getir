import Foundation

// MARK: - Cate
struct Cate: Codable {
    let data: [Datum2]
    let status: String
}

// MARK: - Datum
struct Datum2: Codable {
    let id: String
    let name: String
    let nameAR: String?
    let nameTR: String?
    let image: String?
    let children: [Child]?
    let profitRatio: Int?
    let ecommerceVisible: Bool?
    let ecommerceHomeVisible: Bool?
    let slug: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, nameAR, nameTR, image, children, profitRatio
        case ecommerceVisible, ecommerceHomeVisible, slug
    }
}

struct Child: Codable {
    let id: String?
    let name: String?
    let nameAR: String?
    let nameTR: String?
    let parentCategory: String?
    let image: String?
    let children: [Child]?
    let ecommerceVisible: Bool?
    let ecommerceHomeVisible: Bool?
    let profitRatio: Int?
    let slug: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, nameAR, nameTR, parentCategory, image, children
        case ecommerceVisible, ecommerceHomeVisible, profitRatio, slug
    }
}
