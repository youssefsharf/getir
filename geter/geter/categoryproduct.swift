import SwiftUI
import Foundation


struct Cat: Codable {
    let status: String?
    let results: Int?
    let data: [CatDatum]?
}

struct CatDatum: Codable {
    let metas: Metas?
    let sync: Bool?
    let id: String?
    let name: String?
    let nameAR: String?
    let nameTR: String?
    let type: String?
    let shortDescription: String?
    let shortDescriptionAR: String?
    let shortDescriptionTR: String?
    let description: String?
    let descriptionAR: String?
    let descriptionTR: String?
    let sold: Int?
    let quantity: Int?
    let price: Double?
    let ecommercePrice: Double?
    let ecommercePriceMainCurrency: Double?
    let ecommercePriceBeforeTax: Double?
    let ecommercePriceAftereDiscount: Int?
    let buyingprice: Double?
    let priceAftereDiscount: Int?
    let qr: String?
    let sku: String?
    let unit: String?
    let value: [AnyCodable]?
    let value2: [AnyCodable]?
    let alarm: Int?
    let tax: String?
    let taxPrice: Double?
    let archives: String?
    let currency: Currency?
    let profitRatio: Double?
    let ratingsAverage: Double?
    let ratingsQuantity: Int?
    let additionalInfo: String?
    let addToCart: Int?
    let addToFavourites: Int?
    let stocks: [Stock]?
    let ecommerceActive: Bool?
    let publish: Bool?
    let featured: Bool?
    let sponsored: Bool?
    let height: Int?
    let width: Int?
    let weight: Double?
    let length: Int?
    let alternateProducts: [String]?
    let suppliers: [AnyCodable]?
    let imagesArray: [ImagesArray]?
    let customAttributes: [CustomAttribute]?
    let v: Int?
    let createdAt: String?
    let updatedAt: String?
    let parasutID: String?
    let soldByMonth: Int?
    let soldByWeek: Int?
    let productNo: Int?
    let slug: String?
    let importDate: String?

    enum CodingKeys: String, CodingKey {
        case metas, sync
        case id = "_id"
        case name, nameAR, nameTR, type, shortDescription, shortDescriptionAR, shortDescriptionTR
        case description, descriptionAR, descriptionTR, sold, quantity, price, ecommercePrice
        case ecommercePriceMainCurrency, ecommercePriceBeforeTax, ecommercePriceAftereDiscount
        case buyingprice, priceAftereDiscount, qr, sku, unit, value, value2, alarm, tax, taxPrice
        case archives, currency, profitRatio, ratingsAverage, ratingsQuantity
        case additionalInfo = "AdditionalInfo"
        case addToCart, addToFavourites, stocks, ecommerceActive, publish, featured, sponsored
        case height, width, weight, length, alternateProducts, suppliers, imagesArray
        case customAttributes
        case v = "__v"
        case createdAt, updatedAt, parasutID = "parasutID"
        case soldByMonth, soldByWeek, productNo, slug, importDate
    }
}

// MARK: - تعريف الأنواع الأخرى
struct Metas: Codable {
    let title: Description?
    let description: Description?
    let keywords: Keywords?
}

struct Description: Codable {
    let en: String?
    let ar: String?
    let tr: String?
}

struct Keywords: Codable{
    let en: [String]?
    let ar: [String]?
    let tr: [String]?
}

struct Currency: Codable {
    let id: String?
    let currencyCode: String?
    let currencyName: String?
    let exchangeRate: Double?
    let isPrimary: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case currencyCode, currencyName, exchangeRate
        case isPrimary = "is_primary"
    }
}

struct Stock: Codable {
    let stockId: String?
    let stockName: String?
    let productQuantity: Double?

    enum CodingKeys: String, CodingKey {
        case stockId = "stockId"
        case stockName = "stockName"
        case productQuantity = "productQuantity"
    }
}

struct ImagesArray: Codable {
    let image: String?
    let isCover: Bool?
}

struct CustomAttribute: Codable {
    let value: String?
    let key: String?
}

struct AnyCodable: Codable {}

