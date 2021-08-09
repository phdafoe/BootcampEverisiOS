//
//  CardViewModel.swift
//  CuponForEver
//
//  Created by Andres Felipe Ocampo Eljaiek on 21/6/21.
//

import Foundation

enum CardTypeViewModel: String, Codable {
    case collection = "COLLECTION"
    case deal = "DEAL"
}

struct DataViewModel: Codable {
    
    let cardType: CardTypeViewModel?
    let data: CardViewModel?
    
    init(pCardType: CardTypeViewModel? = .deal, pData: CardViewModel) {
        self.cardType = pCardType ?? .deal
        self.data = pData
    }
}

struct CardViewModel: Codable {
    let descriptor: String?
    let type: String?
    let finePrint: String?
    let announcementTitle: String?
    let images: [ImageViewModel]?
    let endAt: String?
    let tags: [TagViewModel]?
    let dealUrl: String?
    let grid4ImageUrl: String?
    let sidebarImageUrl: String?
    let highlightsHtml: String?
    let pitchHtml: String?
    let priceSummary: PriceSummaryViewModel?
    let largeImageUrl: String?
    let badge: [BadgeViewModel]?
    let division: DivisionViewModel?
    
    init(pDescriptor: String, pType: String, pFinePrint: String, pAnnouncementTitle: String, pImages: [ImageViewModel], pEndAt: String, pTags: [TagViewModel], pDealUrl: String, pGrid4ImageUrl: String, pSidebarImageUrl: String, pHighlightsHtml: String, pPitchHtml: String, pPriceSummary: PriceSummaryViewModel, pLargeImageUrl: String, pBadge: [BadgeViewModel], pDivision: DivisionViewModel) {
        
        self.descriptor  = pDescriptor
        self.type = pType
        self.finePrint = pFinePrint
        self.announcementTitle = pAnnouncementTitle
        self.images = pImages
        self.endAt = pEndAt
        self.tags = pTags
        self.dealUrl = pDealUrl
        self.grid4ImageUrl = pGrid4ImageUrl
        self.sidebarImageUrl = pSidebarImageUrl
        self.highlightsHtml = pHighlightsHtml
        self.pitchHtml = pPitchHtml
        self.priceSummary = pPriceSummary
        self.largeImageUrl = pLargeImageUrl
        self.badge = pBadge
        self.division = pDivision
    }
}

struct ImageViewModel: Codable {
    let url: String?
    init(pUrl: String) {
        self.url = pUrl
    }
}

struct TagViewModel: Codable {
    let name: String?
    init(pName: String) {
        self.name = pName
    }
}

struct PriceSummaryViewModel: Codable {
    let value: PriceViewModel?
    init(pValue: PriceViewModel) {
        self.value = pValue
    }
}

struct PriceViewModel: Codable {
    let formattedAmount: String?
    init(pFormattedAmount: String) {
        self.formattedAmount = pFormattedAmount
    }
    
    
}

struct BadgeViewModel: Codable {
    let text: String?
    let iconImageUrl: String?
    init(pText: String, pIconImageUrl: String) {
        self.text = pText
        self.iconImageUrl = pIconImageUrl
    }
}

struct DivisionViewModel: Codable {
    let lng: Double?
    let name: String?
    let lat: Double?
    init(plng: Double, pName: String, pLat: Double){
        self.lng = plng
        self.name = pName
        self.lat = pLat
    }
}


