//
//  ModelData.swift
//  TestingJSON
//
//  Created by Kushal P on 1/30/21.
//


import Foundation
import SwiftUI
import CoreLocation

struct ModelData: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var issues: [String]
    var recordingNames: [String]
    var country : [String]?
    var imageNames : [String]?
    var seasons : [String]?
    var color: String?
    var isPageView: Bool = false
    
    /** Are these keys needed , seasonName and imageName NOT found in JSON file
        Therefore I put them as optional
     */
    var seasonName: Season?
    private var imageName: String?
   
    

    enum Season: String, CaseIterable, Codable {
        case spring = "Spring"
        case winter = "Winter"
        case summer = "Summer"
        case rainy = "Rainy"
    }
    
    
    
    var image: Image {
        Image(imageName ?? "")
    }
    
    var featureImage: Image? {
        isPageView  ? Image((imageName ?? "") + "_feature") : nil
    }
    
    
  
}
