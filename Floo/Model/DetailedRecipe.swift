// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeDetail = try? newJSONDecoder().decode(RecipeDetail.self, from: jsonData)

import Foundation

// MARK: - RecipeDetail
struct DetailedRecipe: Codable, Hashable {
    static func == (lhs: DetailedRecipe, rhs: DetailedRecipe) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var vegetarian, vegan, glutenFree, dairyFree: Bool?
    var veryHealthy, cheap, veryPopular, sustainable: Bool?
    var lowFodmap: Bool?
    var weightWatcherSmartPoints: Int?
    var gaps: String?
    var preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    var creditsText, license, sourceName: String?
    var pricePerServing: Double?
    var extendedIngredients: [ExtendedIngredient]?
    var id: Int?
    var title: String?
    var readyInMinutes, servings: Int?
    var sourceURL: String?
    var openLicense: Int?
    var image: String?
    var imageType: String?
    var nutrition: Nutrition?
    var summary: String?
    var cuisines, dishTypes: [String]?
    var diets: [String]?
    var occasions: [JSONAny]?
    var winePairing: WinePairing?
    var instructions: String?
    var analyzedInstructions: [AnalyzedInstruction]?
    var originalID: JSONNull?
    var spoonacularSourceURL: String?

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, license, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case openLicense, image, imageType, nutrition, summary, cuisines, dishTypes, diets, occasions, winePairing, instructions, analyzedInstructions
        case originalID = "originalId"
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable{
    var name: String?
    var steps: [Step]?
}

// MARK: - Step
struct Step: Codable, Hashable {
    static func == (lhs: Step, rhs: Step) -> Bool {
        lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    var number: Int?
    var step: String?
    var ingredients: [StepIngredient]?
    var equipment: [JSONAny]?
}

// MARK: - StepIngredient
struct StepIngredient: Codable {
    var id: Int?
    var name, localizedName, image: String?
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable, Hashable, Identifiable {
    static func == (lhs: ExtendedIngredient, rhs: ExtendedIngredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int?
    var aisle, image: String?
    var consistency: Consistency?
    var name, nameClean, original, originalName: String?
    var amount: Double?
    var unit: String?
    var meta: [String]?
    var measures: Measures?
}

enum Consistency: String, Codable {
    case liquid = "LIQUID"
    case solid = "SOLID"
}

// MARK: - Measures
struct Measures: Codable {
    var us, metric: Metric?
}

// MARK: - Metric
struct Metric: Codable {
    var amount: Double?
    var unitShort, unitLong: String?
}

// MARK: - Nutrition
struct Nutrition: Codable {
    var nutrients, properties, flavonoids: [Flavonoid]?
    var ingredients: [NutritionIngredient]?
    var caloricBreakdown: CaloricBreakdown?
    var weightPerServing: WeightPerServing?
}

// MARK: - CaloricBreakdown
struct CaloricBreakdown: Codable {
    var percentProtein, percentFat, percentCarbs: Double?
}

// MARK: - Flavonoid
struct Flavonoid: Codable {
    var name: String?
    var amount: Double?
    var unit: Unit?
    var percentOfDailyNeeds: Double?
}

enum Unit: String, Codable {
    case empty = ""
    case g = "g"
    case iu = "IU"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - NutritionIngredient
struct NutritionIngredient: Codable {
    var id: Int?
    var name: String?
    var amount: Double?
    var unit: String?
    var nutrients: [Flavonoid]?
}

// MARK: - WeightPerServing
struct WeightPerServing: Codable {
    var amount: Int?
    var unit: Unit?
}

// MARK: - WinePairing
struct WinePairing: Codable {
    var pairedWines: [String]?
    var pairingText: String?
    var productMatches: [ProductMatch]?
}

// MARK: - ProductMatch
struct ProductMatch: Codable {
    var id: Int?
    var title, productMatchDescription, price: String?
    var imageURL: String?
    var averageRating: Double?
    var ratingCount: Int?
    var score: Double?
    var link: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case productMatchDescription = "description"
        case price
        case imageURL = "imageUrl"
        case averageRating, ratingCount, score, link
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
