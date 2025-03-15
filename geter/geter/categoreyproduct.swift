import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let metas: Metas
    let sync: Bool
    let id, name, nameAR, nameTR: String
    let type, shortDescription, shortDescriptionAR, shortDescriptionTR: String
    let description, descriptionAR, descriptionTR: String
    let sold, quantity: Int
    let price, ecommercePrice, ecommercePriceMainCurrency: Double
    let ecommercePriceBeforeTax, ecommercePriceAftereDiscount: Int
    let buyingprice: Double
    let priceAftereDiscount: Int
    let qr, sku, unit: String
    let value, value2: [String]
    let alarm: Int
    let tax: String
    let taxPrice: Double
    let archives: String
    let currency: Currency
    let profitRatio: Double
    let ratingsAverage, ratingsQuantity: Int
    let additionalInfo: String
    let addToCart, addToFavourites: Int
    let stocks: [Stock]
    let ecommerceActive, publish, featured, sponsored: Bool
    let height, width, weight, length: Int
    let alternateProducts, suppliers, imagesArray, customAttributes: [String]
    let v: Int
    let createdAt, updatedAt, parasutID: String
    let soldByMonth, soldByWeek, productNo: Int
    let welcomeID: String
}

// MARK: - Currency
struct Currency: Decodable {
    let id, currencyCode, currencyName: String
    let exchangeRate: Int
    let isPrimary: String
}

// MARK: - Metas
struct Metas: Decodable {
    let title, description: Description
    let keywords: Keywords
}

// MARK: - Description
struct Description: Decodable {
    let en, ar, tr: String
}

// MARK: - Keywords
struct Keywords: Decodable {
    let en, ar, tr: [String]
}

// MARK: - Stock
struct Stock: Decodable {
    let stockID, stockName: String
    let productQuantity: Int
}
