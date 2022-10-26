//
//  HomeUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/24.
//

import SwiftUI
import AVKit


struct HomeUIView: View {
  @State private var videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "實現夢想的哆啦A夢", withExtension: "mp4")!)

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor")]), startPoint: .top, endPoint: .bottom)
                VStack{
                    Image("DoraemonTitle")
                    Text("哆啦A夢電子書App")
                    Spacer()
                    HStack{
                        Image("characterBlockBell")
                            .resizable()
                            .frame(width: 24, height: 24)
                        VStack{
                            Text("片頭曲")
                                .font(.custom(FontStyle.name, size: 24))
                        }
                        Image("characterBlockBell")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    Text("曲名-")
                        .font(.custom(FontStyle.name, size: 18))+Text("實現夢想")
                        .font(.custom(FontStyle.name, size: 22))
                        .foregroundColor(Color.yellow)+Text("的")
                        .font(.custom(FontStyle.name, size: 12))+Text("哆啦A夢")
                        .font(.custom(FontStyle.name, size: 22))
                        .foregroundColor(Color.blue)
                    VideoPlayer(player: videoPlayer)
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.8,height: UIScreen.main.bounds.width*0.8)
                        .onDisappear {
                            videoPlayer.pause()
                        }
                    Link(destination:
                            URL(string: "https://doraemon.fandom.com/zh/wiki/%E5%93%86%E5%95%A6A%E5%A4%A2%E6%AD%B7%E4%BB%A3%E7%89%87%E9%A0%AD%E5%8B%95%E7%95%AB")!,
                            label: {
                                HStack{
                                    Text("")
                                    Image("OverOpeningIcon")
                                        .resizable()
                                        .frame(width: 30, height: 45)
                                        .scaledToFit()
                                    Text("線上了解更多片頭曲   ")
                                        .font(.custom(FontStyle.name, size: 13))
                                        .foregroundColor(Color.black)
                
                                }
                                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Capsule())
                                
                            })
                
            }
        }
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
            //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}



