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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive : Bool = false
    
    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal    in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                        .animation(.easeIn, value: UUID())
                    } //: SCROLL
                } //: CONDITION
            } //: GROUP
            
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing : 16) {
                        //LIST BUTTON
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GRID BUTTON
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title3)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } //: HSTACK
                } //: BUTTONS
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
