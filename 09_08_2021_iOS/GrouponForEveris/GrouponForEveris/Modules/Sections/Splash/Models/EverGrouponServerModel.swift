//
//  EverGrouponServerModel.swift
//  CuponForEver
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/6/21.
//

import Foundation

// MARK: - EverGrouponServerModel
struct EverGrouponServerModel: Decodable {
    let cards: [Card]?
    let pagination: Pagination?
    let relevanceService: RelevanceService?
    let features: Features?
    let sortOptions: [SortOption]?

    enum CodingKeys: String, CodingKey {
        case cards = "cards"
        case pagination = "pagination"
        case relevanceService = "relevanceService"
        case features = "features"
        case sortOptions = "sortOptions"
    }
}

// MARK: - Card
struct Card: Decodable {
    let cardType: CardType?
    let data: CardData?

    enum CodingKeys: String, CodingKey {
        case cardType = "cardType"
        case data = "data"
    }
}

enum CardType: String, Decodable {
    case collection = "COLLECTION"
    case deal = "DEAL"
}

// MARK: - CardData
struct CardData: Decodable {
    let isAutoRefundEnabled: Bool?
    let soldQuantityMessage: String?
    let tippingPoint: Int?
    let tippedAt: String?
    let isGiftable: Bool?
    let descriptor: String?
    let type: String?
    let uuid: String?
    let soldQuantity: Int?
    let division: Division?
    let finePrint: String?
    let allowedInCart: Bool?
    let announcementTitle: String?
    let id: String?
    let shippingAddressRequired: Bool?
    let vip: String?
    let images: [Image]?
    let isTravelBookableDeal: Bool?
    let merchant: Merchant?
    let endAt: String?
    let isNowDeal: Bool?
    let displayOptions: [DisplayOption]?
    let isOptionListComplete: Bool?
    let tags: [Tag]?
    let categorizations: [Categorization]?
    let dealUrl: String?
    let isGliveInventoryDeal: Bool?
    let isSellerOfRecord: Bool?
    let grid4ImageUrl: String?
    let isSoldOut: Bool?
    let status: Status?
    let maxDiscountPercentage: Int?
    let dealOptionCount: Int?
    let isTipped: Bool?
    let title: String?
    let isInviteOnly: Bool?
    let accessType: String?
    let sidebarImageUrl: String?
    let highlightsHtml: String?
    let shortAnnouncementTitle: String?
    let startAt: String?
    let pitchHtml: String?
    let priceSummary: PriceSummary?
    let placementPriority: String?
    let badges: [Badge]?
    let isMerchandisingDeal: Bool?
    let largeImageUrl: String?
    let locations: [Location]?
    let placeholderUrl: String?
    let redemptionLocation: String?
    let eligibleForIncentives: Bool?
    let templateGroup: String?
    let name: String?
    let embeddedCards: [EmbeddedCard]?
    let templateVersion: String?
    let templateView: String?
    let templateId: String?
    let cardAttributes: PurpleCardAttributes?
    let rapiFilter: String?

    enum CodingKeys: String, CodingKey {
        case isAutoRefundEnabled = "isAutoRefundEnabled"
        case soldQuantityMessage = "soldQuantityMessage"
        case tippingPoint = "tippingPoint"
        case tippedAt = "tippedAt"
        case isGiftable = "isGiftable"
        case descriptor = "descriptor"
        case type = "type"
        case uuid = "uuid"
        case soldQuantity = "soldQuantity"
        case division = "division"
        case finePrint = "finePrint"
        case allowedInCart = "allowedInCart"
        case announcementTitle = "announcementTitle"
        case id = "id"
        case shippingAddressRequired = "shippingAddressRequired"
        case vip = "vip"
        case images = "images"
        case isTravelBookableDeal = "isTravelBookableDeal"
        case merchant = "merchant"
        case endAt = "endAt"
        case isNowDeal = "isNowDeal"
        case displayOptions = "displayOptions"
        case isOptionListComplete = "isOptionListComplete"
        case tags = "tags"
        case categorizations = "categorizations"
        case dealUrl = "dealUrl"
        case isGliveInventoryDeal = "isGliveInventoryDeal"
        case isSellerOfRecord = "isSellerOfRecord"
        case grid4ImageUrl = "grid4ImageUrl"
        case isSoldOut = "isSoldOut"
        case status = "status"
        case maxDiscountPercentage = "maxDiscountPercentage"
        case dealOptionCount = "dealOptionCount"
        case isTipped = "isTipped"
        case title = "title"
        case isInviteOnly = "isInviteOnly"
        case accessType = "accessType"
        case sidebarImageUrl = "sidebarImageUrl"
        case highlightsHtml = "highlightsHtml"
        case shortAnnouncementTitle = "shortAnnouncementTitle"
        case startAt = "startAt"
        case pitchHtml = "pitchHtml"
        case priceSummary = "priceSummary"
        case placementPriority = "placementPriority"
        case badges = "badges"
        case isMerchandisingDeal = "isMerchandisingDeal"
        case largeImageUrl = "largeImageUrl"
        case locations = "locations"
        case placeholderUrl = "placeholderUrl"
        case redemptionLocation = "redemptionLocation"
        case eligibleForIncentives = "eligibleForIncentives"
        case templateGroup = "templateGroup"
        case name = "name"
        case embeddedCards = "embeddedCards"
        case templateVersion = "templateVersion"
        case templateView = "templateView"
        case templateId = "templateId"
        case cardAttributes = "cardAttributes"
        case rapiFilter = "rapiFilter"
    }
}

// MARK: - Badge
struct Badge: Decodable {
    let uuid: String?
    let primaryColor: String?
    let text: String?
    let secondaryColor: String?
    let mustDisplay: Bool?
    let badgeType: String?
    let displayLocation: String?
    let iconImageUrl: String?

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case primaryColor = "primaryColor"
        case text = "text"
        case secondaryColor = "secondaryColor"
        case mustDisplay = "mustDisplay"
        case badgeType = "badgeType"
        case displayLocation = "displayLocation"
        case iconImageUrl = "iconImageUrl"
    }
}

// MARK: - PurpleCardAttributes
struct PurpleCardAttributes: Decodable {
    let titleText: String?
    let subtitleText: String?

    enum CodingKeys: String, CodingKey {
        case titleText = "titleText"
        case subtitleText = "subtitleText"
    }
}

// MARK: - Categorization
struct Categorization: Decodable {
    let friendlyNameShort: String?
    let children: [CategorizationChild]?
    let friendlyNamePlural: String?
    let friendlyNameSingular: String?
    let id: String?
    let uuid: String?
    let friendlyName: String?

    enum CodingKeys: String, CodingKey {
        case friendlyNameShort = "friendlyNameShort"
        case children = "children"
        case friendlyNamePlural = "friendlyNamePlural"
        case friendlyNameSingular = "friendlyNameSingular"
        case id = "id"
        case uuid = "uuid"
        case friendlyName = "friendlyName"
    }
}

// MARK: - CategorizationChild
struct CategorizationChild: Decodable {
    let friendlyNameShort: String?
    let children: [PurpleChild]?
    let friendlyNamePlural: String?
    let friendlyNameSingular: String?
    let id: String?
    let uuid: String?
    let friendlyName: String?

    enum CodingKeys: String, CodingKey {
        case friendlyNameShort = "friendlyNameShort"
        case children = "children"
        case friendlyNamePlural = "friendlyNamePlural"
        case friendlyNameSingular = "friendlyNameSingular"
        case id = "id"
        case uuid = "uuid"
        case friendlyName = "friendlyName"
    }
}

// MARK: - PurpleChild
struct PurpleChild: Decodable {
    let friendlyNameShort: String?
    let children: [FluffyChild]?
    let friendlyNamePlural: String?
    let friendlyNameSingular: String?
    let id: String?
    let uuid: String?
    let friendlyName: String?

    enum CodingKeys: String, CodingKey {
        case friendlyNameShort = "friendlyNameShort"
        case children = "children"
        case friendlyNamePlural = "friendlyNamePlural"
        case friendlyNameSingular = "friendlyNameSingular"
        case id = "id"
        case uuid = "uuid"
        case friendlyName = "friendlyName"
    }
}

// MARK: - FluffyChild
struct FluffyChild: Decodable {
    let friendlyNameShort: String?
    let children: [TentacledChild]?
    let friendlyNamePlural: String?
    let friendlyNameSingular: String?
    let id: String?
    let uuid: String?
    let friendlyName: String?

    enum CodingKeys: String, CodingKey {
        case friendlyNameShort = "friendlyNameShort"
        case children = "children"
        case friendlyNamePlural = "friendlyNamePlural"
        case friendlyNameSingular = "friendlyNameSingular"
        case id = "id"
        case uuid = "uuid"
        case friendlyName = "friendlyName"
    }
}

// MARK: - TentacledChild
struct TentacledChild: Decodable {
    let friendlyNameShort: String?
    let friendlyNamePlural: String?
    let friendlyNameSingular: String?
    let id: String?
    let uuid: String?
    let friendlyName: String?

    enum CodingKeys: String, CodingKey {
        case friendlyNameShort = "friendlyNameShort"
        case friendlyNamePlural = "friendlyNamePlural"
        case friendlyNameSingular = "friendlyNameSingular"
        case id = "id"
        case uuid = "uuid"
        case friendlyName = "friendlyName"
    }
}

// MARK: - DisplayOption
struct DisplayOption: Decodable {
    let name: String?
    let enabled: Bool?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case enabled = "enabled"
        case value = "value"
    }
}

// MARK: - Division
struct Division: Decodable {
    let timezoneOffsetInSeconds: Int?
    let lng: Double?
    let timezone: String?
    let name: String?
    let id: String?
    let timezoneIdentifier: String?
    let lat: Double?

    enum CodingKeys: String, CodingKey {
        case timezoneOffsetInSeconds = "timezoneOffsetInSeconds"
        case lng = "lng"
        case timezone = "timezone"
        case name = "name"
        case id = "id"
        case timezoneIdentifier = "timezoneIdentifier"
        case lat = "lat"
    }
}

// MARK: - EmbeddedCard
struct EmbeddedCard: Decodable {
    let cardType: CardType?
    let data: EmbeddedCardData?

    enum CodingKeys: String, CodingKey {
        case cardType = "cardType"
        case data = "data"
    }
}

// MARK: - EmbeddedCardData
struct EmbeddedCardData: Decodable {
    let rapiFilter: String?
    let templateGroup: String?
    let name: String?
    let templateVersion: String?
    let templateView: String?
    let templateId: String?
    let cardAttributes: FluffyCardAttributes?
    let uuid: String?

    enum CodingKeys: String, CodingKey {
        case rapiFilter = "rapiFilter"
        case templateGroup = "templateGroup"
        case name = "name"
        case templateVersion = "templateVersion"
        case templateView = "templateView"
        case templateId = "templateId"
        case cardAttributes = "cardAttributes"
        case uuid = "uuid"
    }
}

// MARK: - FluffyCardAttributes
struct FluffyCardAttributes: Decodable {
    let accessoryImage: String?
    let backgroundColor: String?
    let promoText: String?
    let deepLink: String?
    let backgroundImage: String?
    let titleText: String?
    let descriptionText: String?
    let iconImage: String?

    enum CodingKeys: String, CodingKey {
        case accessoryImage = "accessoryImage"
        case backgroundColor = "backgroundColor"
        case promoText = "promoText"
        case deepLink = "deepLink"
        case backgroundImage = "backgroundImage"
        case titleText = "titleText"
        case descriptionText = "descriptionText"
        case iconImage = "iconImage"
    }
}

// MARK: - Image
struct Image: Decodable {
    let url: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}

// MARK: - Location
struct Location: Decodable {
    let uuid: String?
    var id = UUID()
    let lng: Double?
    let lat: Double?
    let distance: Double?
    let distanceSource: DistanceSource?

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case lng = "lng"
        case lat = "lat"
        case distance = "distance"
        case distanceSource = "distanceSource"
    }
}

enum DistanceSource: String, Decodable {
    case externalHome = "external:home"
}

// MARK: - Merchant
struct Merchant: Decodable {
    let websiteUrl: String?
    let name: String?
    let id: String?
    let recommendations: [Recommendation]?
    let uuid: String?

    enum CodingKeys: String, CodingKey {
        case websiteUrl = "websiteUrl"
        case name = "name"
        case id = "id"
        case recommendations = "recommendations"
        case uuid = "uuid"
    }
}

// MARK: - Recommendation
struct Recommendation: Decodable {
    let percentMessage: String?
    let total: Int?
    let totalMessage: String?
    let ratingDistribution: RatingDistribution?
    let rating: Double?
    let source: String?
    let percent: Int?
    let prominentDisplay: Bool?

    enum CodingKeys: String, CodingKey {
        case percentMessage = "percentMessage"
        case total = "total"
        case totalMessage = "totalMessage"
        case ratingDistribution = "ratingDistribution"
        case rating = "rating"
        case source = "source"
        case percent = "percent"
        case prominentDisplay = "prominentDisplay"
    }
}

// MARK: - RatingDistribution
struct RatingDistribution: Decodable {
    let the1: Int?
    let the2: Int?
    let the3: Int?
    let the4: Int?
    let the5: Int?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
    }
}

// MARK: - Option
struct Option: Decodable {
    let soldQuantityMessage: String?
    let bookable: Bool?
    let inventoryService: InventoryService?
    let discount: Price?
    let title: String?
    let uuid: String?
    let soldQuantity: Int?
    let expiresInDays: Int?
    let specificAttributes: SpecificAttributes?
    let price: Price?
    let details: [Detail]?
    let id: String?
    let value: Price?
    let redemptionLocations: [RedemptionLocation]?
    let discountPercent: Int?
    let maximumPurchaseQuantity: Int?
    let minimumPurchaseQuantity: Int?
    let buyUrl: String?
    let endAt: Date?
    let expiresAt: Date?
    let schedulerOptions: SchedulerOptions?
    let isLimitedQuantity: Bool?
    let isSoldOut: Bool?
    let status: Status?

    enum CodingKeys: String, CodingKey {
        case soldQuantityMessage = "soldQuantityMessage"
        case bookable = "bookable"
        case inventoryService = "inventoryService"
        case discount = "discount"
        case title = "title"
        case uuid = "uuid"
        case soldQuantity = "soldQuantity"
        case expiresInDays = "expiresInDays"
        case specificAttributes = "specificAttributes"
        case price = "price"
        case details = "details"
        case id = "id"
        case value = "value"
        case redemptionLocations = "redemptionLocations"
        case discountPercent = "discountPercent"
        case maximumPurchaseQuantity = "maximumPurchaseQuantity"
        case minimumPurchaseQuantity = "minimumPurchaseQuantity"
        case buyUrl = "buyUrl"
        case endAt = "endAt"
        case expiresAt = "expiresAt"
        case schedulerOptions = "schedulerOptions"
        case isLimitedQuantity = "isLimitedQuantity"
        case isSoldOut = "isSoldOut"
        case status = "status"
    }
}

// MARK: - Detail
struct Detail: Decodable {
    let detailDescription: String?

    enum CodingKeys: String, CodingKey {
        case detailDescription = "description"
    }
}

// MARK: - Price
struct Price: Decodable {
    let currencyExponent: Int?
    let amount: Int?
    let formattedAmount: String?
    let currencyCode: CurrencyCode?

    enum CodingKeys: String, CodingKey {
        case currencyExponent = "currencyExponent"
        case amount = "amount"
        case formattedAmount = "formattedAmount"
        case currencyCode = "currencyCode"
    }
}

enum CurrencyCode: String, Decodable {
    case eur = "EUR"
}

// MARK: - InventoryService
struct InventoryService: Decodable {
    let inventoryProductUuid: String?
    let id: ID?

    enum CodingKeys: String, CodingKey {
        case inventoryProductUuid = "inventoryProductUuid"
        case id = "id"
    }
}

enum ID: String, Decodable {
    case vis = "vis"
}

// MARK: - RedemptionLocation
struct RedemptionLocation: Decodable {
    let country: Country?
    let lng: Double?
    let city: String?
    let ordering: Int?
    let postalCode: String?
    let streetAddress1: String?
    let streetAddress2: String?
    let uuid: String?
    let name: String?
    let presenceAIEnabled: Bool?
    let state: String?
    let id: Int?
    let lat: Double?

    enum CodingKeys: String, CodingKey {
        case country = "country"
        case lng = "lng"
        case city = "city"
        case ordering = "ordering"
        case postalCode = "postalCode"
        case streetAddress1 = "streetAddress1"
        case streetAddress2 = "streetAddress2"
        case uuid = "uuid"
        case name = "name"
        case presenceAIEnabled = "presenceAIEnabled"
        case state = "state"
        case id = "id"
        case lat = "lat"
    }
}

enum Country: String, Decodable {
    case es = "ES"
}

// MARK: - SchedulerOptions
struct SchedulerOptions: Decodable {
    let enabledFeatures: [String]?
    let bookingType: String?
    let active: Bool?
    let bookingProviderName: String?

    enum CodingKeys: String, CodingKey {
        case enabledFeatures = "enabledFeatures"
        case bookingType = "bookingType"
        case active = "active"
        case bookingProviderName = "bookingProviderName"
    }
}

// MARK: - SpecificAttributes
struct SpecificAttributes: Decodable {
    let takeoutDelivery: TakeoutDelivery?

    enum CodingKeys: String, CodingKey {
        case takeoutDelivery = "takeoutDelivery"
    }
}

// MARK: - TakeoutDelivery
struct TakeoutDelivery: Decodable {
    let delivery: Bool?
    let takeout: Bool?

    enum CodingKeys: String, CodingKey {
        case delivery = "delivery"
        case takeout = "takeout"
    }
}

enum Status: String, Decodable {
    case statusOpen = "open"
}

// MARK: - PriceSummary
struct PriceSummary: Decodable {
    let discountPercent: Int?
    let price: Price?
    let minimumPurchaseQuantity: Int?
    let redemptionOffer: RedemptionOffer?
    let value: Price?
    let quoteId: String?

    enum CodingKeys: String, CodingKey {
        case discountPercent = "discountPercent"
        case price = "price"
        case minimumPurchaseQuantity = "minimumPurchaseQuantity"
        case redemptionOffer = "redemptionOffer"
        case value = "value"
        case quoteId = "quoteId"
    }
}

// MARK: - RedemptionOffer
struct RedemptionOffer: Decodable {
    let maximumDiscount: Price?
    let minimumPurchaseValue: Price?

    enum CodingKeys: String, CodingKey {
        case maximumDiscount = "maximumDiscount"
        case minimumPurchaseValue = "minimumPurchaseValue"
    }
}

// MARK: - Tag
struct Tag: Decodable {
    let name: String?
    let uuid: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uuid = "uuid"
    }
}

// MARK: - TextAd
struct TextAd: Decodable {
    let headline: String?
    let line2: String?
    let line1: String?

    enum CodingKeys: String, CodingKey {
        case headline = "headline"
        case line2 = "line2"
        case line1 = "line1"
    }
}

// MARK: - UrgencyMessages
struct UrgencyMessages: Decodable {
    let sellingFast: SellingFast?
    let dailyViews: Daily?
    let timer: Timer?
    let dailyPurchases: Daily?

    enum CodingKeys: String, CodingKey {
        case sellingFast = "sellingFast"
        case dailyViews = "dailyViews"
        case timer = "timer"
        case dailyPurchases = "dailyPurchases"
    }
}

// MARK: - Daily
struct Daily: Decodable {
    let messageText: String?
    let visibility: String?
    let icon: Icon?
    let position: Int?
    let type: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case messageText = "messageText"
        case visibility = "visibility"
        case icon = "icon"
        case position = "position"
        case type = "type"
        case order = "order"
    }
}

// MARK: - Icon
struct Icon: Decodable {
    let id: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
    }
}

// MARK: - SellingFast
struct SellingFast: Decodable {
    let messageText: String?
    let color: String?
    let visibility: String?
    let icon: Icon?
    let position: Int?
    let type: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case messageText = "messageText"
        case color = "color"
        case visibility = "visibility"
        case icon = "icon"
        case position = "position"
        case type = "type"
        case order = "order"
    }
}

// MARK: - Timer
struct Timer: Decodable {
    let visibility: String?
    let icon: Icon?
    let position: Int?
    let type: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case visibility = "visibility"
        case icon = "icon"
        case position = "position"
        case type = "type"
        case order = "order"
    }
}

// MARK: - Features
struct Features: Decodable {
    let pageViewData: PageViewData?

    enum CodingKeys: String, CodingKey {
        case pageViewData = "pageViewData"
    }
}

// MARK: - PageViewData
struct PageViewData: Decodable {
}

// MARK: - Pagination
struct Pagination: Decodable {
    let offset: Int?
    let count: Int?
    let cardTypeCount: CardTypeCount?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case count = "count"
        case cardTypeCount = "cardTypeCount"
    }
}

// MARK: - CardTypeCount
struct CardTypeCount: Decodable {
    let total: Int?
    let dealExactMatch: Int?
    let deals: Int?
    let merchandising: Int?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case dealExactMatch = "dealExactMatch"
        case deals = "deals"
        case merchandising = "merchandising"
    }
}

// MARK: - RelevanceService
struct RelevanceService: Decodable {
    let persistentRanking: String?
    let context: String?
    let treatment: String?
    let attributionId: String?

    enum CodingKeys: String, CodingKey {
        case persistentRanking = "persistentRanking"
        case context = "context"
        case treatment = "treatment"
        case attributionId = "attributionId"
    }
}

// MARK: - SortOption
struct SortOption: Decodable {
    let id: String?
    let friendlyName: String?
    let selected: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case friendlyName = "friendlyName"
        case selected = "selected"
    }
}


