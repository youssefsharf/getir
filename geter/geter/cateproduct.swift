import Foundation

// MARK: - Cate
struct Cate: Codable {
    let data: [Datum2]
    let status: String
} 

// MARK: - Datum
struct Datum2: Codable {
    let image: String
    let ecommerceHomeVisible: Bool
    let nameAR: String
    let children: [String]
    let nameTR: String
    let v: Int
    let ecommerceVisible: Bool
    let name, id, slug: String
    let profitRatio: Int
    let sync: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, nameAR, nameTR, image, children, profitRatio
        case v = "__v"
        case ecommerceVisible, ecommerceHomeVisible, slug, sync
    }
}
