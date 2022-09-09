//
//  VideoPlayerView.swift
//  AfricaApp-SwiftUI
//
//  Created by JunHyuk Lim on 9/9/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    var videoSelected : String
    var videoTitle : String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
            }
            .overlay(alignment: .topLeading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
            }
        } //: VSTACK
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
