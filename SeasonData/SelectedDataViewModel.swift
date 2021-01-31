//
//  SelectedDataViewModel.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct SelectedData {
    
    var name : String = ""
    var issues: [String]
    var recordingNames: [String]
}


class SelectedDataViewModel : ObservableObject {
    
    @Published private var selectedData : [Int : SelectedData] = [:]
    
    func addToSelectedData(id : Int, data : SelectedData){
        
        if !selectedData.keys.contains( id ){
            
            selectedData[id] = data
        }
    }
    
    func removeFromSelectedData (id : Int ){
        
        selectedData.removeValue(forKey: id)
    }
    
    
    func isSelected(id : Int ) -> Bool {
        
        return selectedData.keys.contains(id)
    }
    
    func clearAll(){
        
        selectedData.removeAll()
    }
    
    
    func data(id : Int ) -> SelectedData? {
        
        return selectedData[id]
    }
    
    func ids() -> [Int] {
        
        let ids = selectedData.keys.map { $0 }
        return ids 
    }
}
