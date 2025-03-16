

// MARK: - Cat
struct Cat {
    let data: [Datum]
    let results: Int
    let status: String
}

// MARK: - Datum
struct Datum {
    let ecommercePriceBeforeTax: Double
    let featured: Bool
    let value2, suppliers: [Any?]
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
    let value: [Any?]
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
    let category: Category?
    let brand: String?
}

enum AdditionalInfo {
    case additionalInfo
}

enum Category {
    case the67Bd7B2Ce1D73Ac9906062A1
    case the67Bd7B4De1D73Ac9906062A7
    case the67Bd7B8Ce1D73Ac9906062C3
    case the67Bd7Ba8E1D73Ac9906062CA
    case the67Bd7C05E1D73Ac9906062Df
    case the67Bd7C54E1D73Ac99060631B
    case the67Bd7C6Be1D73Ac990606322
    case the67Bd7C92E1D73Ac990606329
    case the67Bd7Cb1E1D73Ac990606330
    case the67Bd7Ce4E1D73Ac990606337
    case the67Bd7D0De1D73Ac99060633E
    case the67C6B5Bf27Bcf07Ef6Cc4140
    case the67Cacee0E9B92C6338053Fb7
}

// MARK: - Currency
struct Currency {
    let currencyName: CurrencyName
    let isPrimary: String
    let exchangeRate: Double
    let id: ID
    let currencyCode: CurrencyCode
}

enum CurrencyCode {
    case currencyCode
    case empty
}

enum CurrencyName {
    case trl
    case usd
}

enum ID {
    case the67Bd7864E1D73Ac990606201
    case the67Bd82Fee1D73Ac990606459
}

// MARK: - CustomAttribute
struct CustomAttribute {
    let value, key: String
}

// MARK: - ImagesArray
struct ImagesArray {
    let image: String
    let isCover: Bool
}

// MARK: - Metas
struct Metas {
    let keywords: Keywords
    let description, title: Description
}

// MARK: - Description
struct Description {
    let ar: String
    let en: En
    let tr: String
}

enum En {
    case empty
    case lenovoLecooM1102OptikKabloluMouseFiyatları
}

// MARK: - Keywords
struct Keywords {
    let ar, en, tr: [Any?]
}

enum NameAR {
    case empty
    case nameAR
    case zkTecoSF300قارئبصماتالأصابع
}

enum ShortDescription {
    case productShortDescription
}

// MARK: - Stock
struct Stock {
    let productQuantity: Double
    let stockName: StockName
    let stockID: StockID
}

enum StockID {
    case the67Bd7863E1D73Ac9906061F9
}

enum StockName {
    case mainStcok
}

enum Tax {
    case the67Bd7E39E1D73Ac99060635F
    case the67Bd7E45E1D73Ac990606373
}

enum TypeEnum {
    case normal
}

enum Unit {
    case the67Bd7Ea2E1D73Ac9906063C0
    case the67Bd7Ea9E1D73Ac9906063C7
    case the67Bd7Eb3E1D73Ac9906063Ce
}

