// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? JSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct  Category: Codable, Identifiable{
    let id, name, nameAR, nameTR: String
    let parentCategory: String
    let image: String
    let children: [Category]
    let profitRatio, v: Int
}

