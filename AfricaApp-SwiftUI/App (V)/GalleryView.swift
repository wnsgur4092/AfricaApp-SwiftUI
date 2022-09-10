//
//  GalleryView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 6/9/2022.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    @State private var selectedAnimal : String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //    let gridLayOut : [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //EFFICIENT GRID DEFINITION
    //    let gridLayOut : [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    //DYNAMIC GRIDVIEW LAYOUT
    @State private var gridLayOut : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    func gridSwitch() {
        gridLayOut = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }

                
                //MARK: - GRID
                LazyVGrid(columns: gridLayOut, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: LOOP
                }//: GRID
                .animation(.easeIn, value: UUID())
                
                .onAppear {
                    gridSwitch()
                }
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL
        .frame(maxWidth : .infinity, maxHeight: .infinity)
    }
}


//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
