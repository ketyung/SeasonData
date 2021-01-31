//
//  ListViewForRecordings.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct ListViewForRecordings : View {
    
    @ObservedObject var seasonData = SeasonData()
  
    var body: some View {
        
        List(seasonData.recordings, id: \.self){
            recordings in
            
            HStack {
                
                ForEach (recordings, id:\.self){
                    recording in
                    
                    Text(recording)
                    
                }
            }
        }
    }
}


struct ListViewForRecordings_Previews: PreviewProvider {
    static var previews: some View {
        ListViewForRecordings()
    }
}
