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
    
    @Published private var selectedData : [Int : ModelData] = [:]
   
    
    var features: [ModelData] {
        seasondata.filter { $0.isPageView }
    }

    var categories: [String: [ModelData]] {
        Dictionary(
            grouping: seasondata,
            by: { $0.seasonName?.rawValue ?? "" }
        )
    }
    
    
    var recordings : [[String]] {
        
        var str : [[String]] = [[]]
        seasondata.forEach{
            str.append($0.recordingNames)
        }
        return str 
    }
    
    
    
    func addToSelectedData(_ data : ModelData, toRemoveIfExists : Bool = true ){
        
        if !selectedData.keys.contains( data.id ){
            
            selectedData[data.id] = data
        }
        else {
            
            if toRemoveIfExists {
                
                selectedData.removeValue(forKey: data.id )
            }
        }
    }
    
    func removeFromSelectedData (id : Int ){
        
        selectedData.removeValue(forKey: id)
    }
    
    
    func isSelected(id : Int ) -> Bool {
        
        return selectedData.keys.contains(id)
    }
    
    func clearAllSelected(){
        
        selectedData.removeAll()
    }
    
    
    func dataInSelected(id : Int ) -> ModelData? {
        
        return selectedData[id]
    }
    
    func selectedIds() -> [Int] {
        
        let ids = selectedData.keys.map { $0 }
        return ids
    }
    
    
    func selectedValues() -> [ModelData ]{
        
        let models = selectedData.values.map { $0 }
        return models 
    }
}
