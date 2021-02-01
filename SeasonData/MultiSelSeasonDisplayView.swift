//
//  MultiSelSeasonDisplayView.swift
//  SeasonData
//
//  Created by Chee Ket Yung on 31/01/2021.
//

import SwiftUI

struct MultiSeasonDisplayView : View {
    
    var selectedData = SeasonData()
  
    var body: some View {
        // let _ = print("\(selectedData.ids())")
        
        List(selectedData.selectedValues(), id: \.id){
            model in
            
            VStack (alignment: .leading, spacing: 20){
                
                Text("Item \(model.id) : \(model.name)")
                    .font(.headline)
                
                itemScrollView(itemName: "Recordings", items: model.recordingNames)
                
                itemScrollView(itemName: "Issues", items: model.issues, textBackgroundColor: .orange)
            }
            
            
        }
        
    }
}



extension MultiSeasonDisplayView {
    
    // function to return some View for displaying
    // a HStack of Text view as the title and
    // followed by a horizontal scroll view for the items
    private func itemScrollView ( itemName : String, items : [String], textBackgroundColor : Color = .blue) -> some View {
        
        HStack {
            
            Text("\(itemName) :")
            .font(.body)
            
            ScrollView (.horizontal, showsIndicators: false){
                
                HStack (spacing: 10) {
                
                    ForEach(items, id:\.self){
                        item in
                        
                        Text(item)
                        .padding()
                        .frame(height: 30)
                        .background(textBackgroundColor)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(20)
                    }
                }
                
            }
        }
    }
}
