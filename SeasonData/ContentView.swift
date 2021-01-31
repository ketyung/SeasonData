//
//  ContentView.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var seasonData = SeasonData()
    
    var body: some View {
   
        List(seasonData.features){
            season in
            
            VStack(alignment:.leading, spacing : 10) {
            
                Text(season.name)
                    .font(.headline)
                HStack {
                
                    ForEach(season.recordingNames, id:\.self){
                        recording in
                        
                        Text(recording)
                            .font(.caption)
                        
                    }
                }
                
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
