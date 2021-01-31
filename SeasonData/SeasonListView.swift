//
//  SeasonListView.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI


struct SelecetedData {
    
    var issues: [String]
    var recordingNames: [String]
}

struct SeasonListView  : View {
    
    @ObservedObject var seasonData = SeasonData()
    
    var body: some View {
        
        NavigationView {
    
            List(seasonData.features) {
                    season in
           
                    NavigationLink (
                    destination:
                        SeasonDataView(seletedData: SelecetedData(issues: season.issues, recordingNames: season.recordingNames) ) ){
                   
                        Text(season.name)
                    }
            }
            
            
        }
        
        
    }
    
}


struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView()
    }
}





