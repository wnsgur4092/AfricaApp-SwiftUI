//
//  ContentView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 6/9/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    } //: NAVIGATION
                } //: LOOP
            } //: LIST
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
