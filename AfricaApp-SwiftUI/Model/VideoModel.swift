//
//  VideoModel.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 9/9/2022.
//

import Foundation

struct Video : Codable, Identifiable{
    let id : String
    let name : String
    let headline : String
    
    //Computer Property
    var thumbnail : String {
        "video-\(id)"
    }
}
