//
//  MapAnnotationView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 10/9/2022.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - PROPERTIES
    
    @State private var animation : Double = 0.0
    var location : NationalParkLocaiton
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + (animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations : [NationalParkLocaiton] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0]).previewLayout(.sizeThatFits).padding()
    }
}
