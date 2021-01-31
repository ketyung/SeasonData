//
//  SeasonData.swift
//  TestingJSON
//
//  Created by Kushal P on 1/30/21.
//

import Foundation
import Combine


extension Bundle {

    func decodeJson <T:Decodable> (_ type : T.Type , fileName : String,
         dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
         keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
            
         guard let url = self.url(forResource: fileName, withExtension: nil) else {
             fatalError("Failed to load file ")
         }
            
         do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
                
            let result = try decoder.decode(type, from: jsonData)
            return result
         }
         catch {
            fatalError("err:\(error)")
         }
    }
}

final class SeasonData: ObservableObject {
    
    @Published var seasondata = Bundle.main.decodeJson([ModelData].self, fileName: "SeasonData.json")
    
    var features: [ModelData] {
        seasondata.filter { $0.isPageView }
    }

    var categories: [String: [ModelData]] {
        Dictionary(
            grouping: seasondata,
            by: { $0.seasonName?.rawValue ?? "" }
        )
    }
    
}
