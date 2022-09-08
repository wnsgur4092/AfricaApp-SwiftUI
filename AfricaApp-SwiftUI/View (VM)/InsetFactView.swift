//
//  InsetFactView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 8/9/2022.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    let animal : Animal
    
    //MARK: - BODY
    var body: some View {
        Group {
            TabView{
                ForEach(animal.fact, id:\.self) { item in
                    Text(item)
                } //: LOOP
            } //: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GROUP
    }
}

//MARK: - PREVIEWa
struct InsetFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
    }
}
