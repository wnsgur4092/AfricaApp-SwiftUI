//
//  LocationModel.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 9/9/2022.
//

import Foundation
import MapKit

struct NationalParkLocaiton : Codable, Identifiable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    //Compute Property
    var location : CLLocationCoordinate2D{CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
}
