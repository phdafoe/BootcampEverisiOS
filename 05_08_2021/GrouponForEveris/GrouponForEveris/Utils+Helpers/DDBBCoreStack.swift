//
//  DDBBCoreStack.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import Foundation

class DDBBCoreStack {
    
    static let shared = DDBBCoreStack()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "lastRefresh"
    private let calendar = Calendar.current
    
    func loadDataIfNeeded(completionHandler: @escaping (Bool) -> ()) {
        if isRefreshingRequired() {
            defaults.setValue(Date(), forKey: defaultsKey)
            completionHandler(true)
        } else {
            completionHandler(false)
        }
    }
    
    private func isRefreshingRequired() -> Bool {
        guard let lastRefreshing = defaults.object(forKey: defaultsKey) as? Date else {
            return true
        }
        if let diff = calendar.dateComponents([.hour], from: lastRefreshing, to: Date()).hour, diff > 12 {
            return true
        } else {
            return false
        }
    }
}

extension DDBBCoreStack {
    
    func setCuponList(data: [DataViewModel]) {
        do {
            defaults.set(try PropertyListEncoder().encode(data), forKey: DDBBCoreStack.Constants.cuponList)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getCuponList() -> [DataViewModel]? {
        var myData: [DataViewModel] = []
        if let data = defaults.value(forKey: DDBBCoreStack.Constants.cuponList) as? Data {
            do {
                myData = try PropertyListDecoder().decode([DataViewModel].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            return nil
        }
        return myData
    }
}

private extension DDBBCoreStack {
    struct Constants {
        static let cuponList = "cuponList"
    }
}
