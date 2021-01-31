//
//  SeasonDataView.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct SeasonDataView : View {
    
    var seletedData : SelectedData
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                
                ForEach(seletedData.recordingNames, id:\.self){
                    data in
                    
                    Text(data)
                }
                
            }
            
            
            VStack(alignment: .leading, spacing: 20){
                
                ForEach(seletedData.issues, id:\.self){
                    data in
                    
                    Text(data)
                    
                }
                
            }
        }
    }
}
