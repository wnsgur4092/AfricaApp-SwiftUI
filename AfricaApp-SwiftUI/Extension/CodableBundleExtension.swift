//
//  CodableBundleExtension.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 6/9/2022.
//

import Foundation

extension Bundle {
    func decode(_ file : String) -> [CoverImage] {
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //3. create a decoder
        let decoder = JSONDecoder()
        
        //4. create a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        //5. return the ready-to-use data
        return loaded
    }
    
    
    
}
