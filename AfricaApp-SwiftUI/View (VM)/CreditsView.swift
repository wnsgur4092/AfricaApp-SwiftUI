//
//  CreditsView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 11/9/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width:128, height: 128)
            Text("""
Copyright © Jun
All right reserved
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
            
        } //: VSTACK
        
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView().previewLayout(.sizeThatFits).padding()
    }
}
