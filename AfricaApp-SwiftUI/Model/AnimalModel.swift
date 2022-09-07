//
//  AnimalModel.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 7/9/2022.
//

import Foundation

struct Animal : Codable, Identifiable {
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}
