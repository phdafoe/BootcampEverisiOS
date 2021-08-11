//
//  SplashDosInteractor.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation

protocol SplashDosInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataFromInteractor()
}

final class SplashDosInteractor: InteractorInterface {
    
    weak var presenter: SplashDosPresenterInteractorInterface!
    let provider: SplashProviderProtocol = SplashProvider()
    
    private func transformDataViewModel(data: [Card]) -> [DataViewModel] {
        var arrayData: [DataViewModel] = []
        for index in 0..<data.count{
            if let modelData = data[index].data{
                let obj = DataViewModel(pCardType: .deal, pData: self.transformDataToCardViewModel(data: modelData))
                arrayData.append(obj)
            }
        }
        return arrayData
    }
    
    private func transformDataToCardViewModel(data: CardData) -> CardViewModel {
        let modelData = CardViewModel(pDescriptor: data.descriptor ?? "",
                                      pType: data.type ?? "",
                                      pFinePrint: data.finePrint ?? "",
                                      pAnnouncementTitle: data.announcementTitle ?? "",
                                      pImages: self.transformDataToImageViewModel(data: data.images ?? []),
                                      pEndAt: data.endAt ?? "",
                                      pTags: self.transformDataToTagViewModel(data: data.tags ?? []),
                                      pDealUrl: data.dealUrl ?? "",
                                      pGrid4ImageUrl: data.grid4ImageUrl ?? "",
                                      pSidebarImageUrl: data.sidebarImageUrl ?? "",
                                      pHighlightsHtml: data.highlightsHtml ?? "",
                                      pPitchHtml: data.pitchHtml ?? "",
                                      pPriceSummary: self.transformDataToPriceSummaryViewModel(data: data.priceSummary) ?? PriceSummaryViewModel(pValue: PriceViewModel(pFormattedAmount: "")),
                                      pLargeImageUrl: data.largeImageUrl ?? "",
                                      pBadge: self.trasnformDataToBadgeViewModel(data: data.badges ?? []),
                                      pDivision: self.transformDataToDivisionViewModel(data: data.division))
        return modelData
    }
    
    private func transformDataToImageViewModel(data: [Image]) -> [ImageViewModel] {
        var arrayImage: [ImageViewModel] = []
        for item in 0..<data.count {
            let model = ImageViewModel(pUrl: data[item].url ?? "")
            arrayImage.append(model)
        }
        return arrayImage
    }
    
    private func transformDataToTagViewModel(data: [Tag]) -> [TagViewModel] {
        var arrayTags: [TagViewModel] = []
        for item in 0..<data.count {
            let model = TagViewModel(pName: data[item].name ?? "")
            arrayTags.append(model)
        }
        return arrayTags
    }
    
    private func transformDataToPriceSummaryViewModel(data: PriceSummary?) -> PriceSummaryViewModel? {
        if let dataDes = data{
            let model = PriceViewModel(pFormattedAmount: dataDes.price?.formattedAmount ?? "")
            let priceModel = PriceSummaryViewModel(pValue: model)
            return priceModel
        }
        return nil
    }
    
    private func trasnformDataToBadgeViewModel(data: [Badge]) -> [BadgeViewModel] {
        var arrayBadges: [BadgeViewModel] = []
        for item in 0..<data.count {
            let model = BadgeViewModel(pText: data[item].text ?? "", pIconImageUrl: data[item].iconImageUrl ?? "")
            arrayBadges.append(model)
        }
        return arrayBadges
    }
    
    private func transformDataToDivisionViewModel(data: Division?) -> DivisionViewModel {
        DivisionViewModel(plng: data?.lng ?? 0.0, pName: data?.name ?? "", pLat: data?.lat ?? 0.0)
    }
    
}

extension SplashDosInteractor: SplashDosInteractorPresenterInterface {
    
    func fetchDataFromInteractor() {
        
        DDBBCoreStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
            if isRefreshingRequired {
                self.provider.fetchData { [weak self] (result) in
                    guard self != nil else { return }
                    DDBBCoreStack.shared.setCuponList(data: self?.transformDataViewModel(data: result.cards ?? []) ?? [])
                    self?.presenter?.getDataFromInteractor(data: self?.transformDataViewModel(data: result.cards ?? []))
                } failure: { (error) in
                    print(error.localizedDescription)
                }
            } else {
                self.presenter?.getDataFromInteractor(data: DDBBCoreStack.shared.getCuponList())
            }
        }
    }
}
