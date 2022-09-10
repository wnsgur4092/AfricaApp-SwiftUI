//
//  CenterModifier.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 11/9/2022.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
