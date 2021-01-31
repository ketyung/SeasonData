//
//  MultiSelSeasonListView.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct MultiSelSeasonListView : View {
    
    @ObservedObject var seasonData = SeasonData()
  
    
    
    var body: some View {
        
        NavigationView {
        
            VStack(spacing : 20) {
            
                Text("Choose Your Season Below:")
                .font(.headline)
                
                // Long code put in a function that returns some View
                // for better code readability
                listViewOfSeasonData()
                
                NavigationLink(
                    destination: MultiSeasonDisplayView(selectedData : seasonData)){
                    
                    Text("View Selections")
                }
                
                Spacer()
                
            }.padding()
            
        }
        
    }
}


extension MultiSelSeasonListView {
    
    
    private func listViewOfSeasonData() -> some View {
        
        List (seasonData.features) {
            season in
            
            Button(action: {
      
                if seasonData.isSelected(id: season.id ){
              
                    seasonData.removeFromSelectedData(id: season.id)
                }
                else {
          
                    seasonData.addToSelectedData(ModelData(id : season.id , name : season.name ,issues: season.issues, recordingNames: season.recordingNames))
              
                }
                
            }, label: {
           
                HStack(spacing: 20) {
               
                    Text(season.name)
                    .frame(width: 180, height: 50, alignment:.leading)
                    .font(.headline)
                    
                    if seasonData.isSelected(id: season.id){
                        
                        Image(systemName: "checkmark.circle")
                    }
               
                }
                .frame(width: 300, height: 50, alignment:.leading)
                
               
            
            })
            
        }
        .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
