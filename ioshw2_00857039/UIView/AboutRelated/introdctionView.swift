//
//  introdctionView.swift
//  ioshw2_00857039
//
//  Created by User11 on 2022/10/26.
//

import SwiftUI
import AVFoundation

struct introdctionView: View {
  
  @State private var isShowing: Bool = false
  @State private var isPlaying: Bool = false
  
  @State var musicImage:String = "play.circle.fill"
  
  
  let player = AVPlayer()
    
    var body:some View{
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor")]), startPoint: .top, endPoint: .bottom)
          ScrollView{
            VStack{
                HStack{
                    VStack{
                      Text("大山版動畫片頭曲-")
                          .font(.custom(FontStyle.name, size: 18))
                      Text("哆啦A夢之歌")
                          .font(.custom(FontStyle.name, size: 22))
                          .foregroundColor(Color.blue)
                      }
                    Image(systemName: musicImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.pink)
                        .onTapGesture(){
                            let url = Bundle.main.url(forResource: "DoraemonTheme", withExtension: "mp3")!
                            let playerItem = AVPlayerItem(url: url)
                            player.replaceCurrentItem(with: playerItem)
                            self.isPlaying.toggle()
                            if(self.isPlaying == true){
                                player.play()
                              
                                self.musicImage = "stop.circle.fill"
                            }else{
                                player.pause()
                                self.musicImage = "play.circle.fill"
                            }
                        }
                        .onDisappear() {
                          player.pause()
                          self.isPlaying = false
                          self.musicImage = "play.circle.fill"
                        }
                }
                Text(introdctionView.intro)
                    .offset(y: isShowing ? 0: 50)
                    .opacity(isShowing ? 1: 0)
                    .animation(Animation.easeInOut(duration: 0.6), value: isShowing)
                Text(introdctionView.intro2)
                    .offset(y: isShowing ? 0: 50)
                    .opacity(isShowing ? 1: 0)
                    .animation(Animation.easeInOut(duration: 0.6).delay(0.4), value: isShowing)
                Text(introdctionView.intro3)
                    .offset(y: isShowing ? 0: 50)
                    .opacity(isShowing ? 1: 0)
                    .animation(Animation.easeInOut(duration: 0.6).delay(0.8), value: isShowing)
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("《哆啦A夢》作品簡介")
                        .font(.custom(FontStyle.name, size: 20))
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                self.isShowing = true
            }
          }}
    }
}

struct introdctionView_Previews: PreviewProvider {
    static var previews: some View {
        introdctionView()
    }
}

extension introdctionView{
    static let intro:String =
    """
    
    《哆啦A夢》（日語：ドラえもん）為日本漫畫家藤子·F·不二雄筆下著名的兒童、科幻類型日本漫畫，自1969年12月開始連載，在原作者去世後，又由其弟子創作了大量漫畫，仍有新作在不斷推出，還衍生出電視動畫、大長篇改編電影、小說，甚至許多周邊產品，至今已成為日本國民級長壽動漫。

    """
    
    static let intro2:String =
    """

    本作敍述了一隻來自22世紀的貓型機器人——哆啦A夢，受主人野比世修的託付，回到20世紀，藉助從四維口袋裏拿出來的各種未來道具，來幫助世修的高祖父——小學生野比大雄化解身邊的種種困難問題，以及生活中和媽媽野比玉子、身邊的小夥伴靜香、胖虎、小夫發生的輕鬆幽默搞笑感人的故事。

    """
    
    static let intro3:String =
    """

    另外，哆啦A夢動畫有三個時期的畫風：

    1.日本電視台版       1973
    2.大山羨代版     1979~2005
    3.水田山葵版     2005~現今

    其中2跟3都是因哆啦A夢聲優名字而得名。

    """
}
