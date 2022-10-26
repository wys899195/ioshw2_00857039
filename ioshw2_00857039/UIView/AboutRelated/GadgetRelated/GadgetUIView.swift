//
//  GadgetUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/22.
//

import SwiftUI

struct GadgetUIView: View {
    var body: some View {
        List{
            ForEach(Gadget.gedgets){ gadget in
                NavigationLink(
                    destination: GadgetDetailUIView(selectedTab: gadget.id),
                    label: {
                      GadgetRow(gadget: gadget)
                    }
                )
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("常見道具")
                    .font(.custom(FontStyle.name, size: 20))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
  
    }
}

struct GadgetUIView_Previews: PreviewProvider {
    static var previews: some View {
        GadgetUIView()
    }
}

struct Gadget:Identifiable{
    let id:Int
    let name:String
    let image:String
    let description:String
}
extension Gadget{
    static let gedgets = [
      Gadget(id:0,name: "四次元百寶袋", image: "gadget_4D_Pocket",
             description: """

                          外觀為一白色半圓形袋子，功能是放置其他的所有道具，其連結到四度空間，因此可以空間無限大。

                          哆啦A夢的四次元口袋一共有兩個，備用口袋是在主要口袋拿去清洗時作為備用之用，兩個口袋會通到同一個空間中。哆啦A夢一般把備用口袋放在大雄房間櫥櫃的被子或枕頭下面，不時會被大雄偷拿去使用。

                          """),
      Gadget(id:1,name: "竹蜻蜓", image: "gadget_Bambo",
             description: """

                          外型與同名兒童玩具類似，有兩片葉片（僅為裝飾），底下是做為接頭連結目標物的半球型底座，內部裝有一個超小電池。

                          只要裝在人身上任何地方（通常是頭上），就能夠隨使用者想法以任何方向與動作飛行，就算沒電時，只要休息20個小時還可繼續使用。

                          """),
      Gadget(id:2,name: "時光機", image: "gadget_Time_machine",
             description: """
                          
                          時光機功能為能穿越時間和空間。使用時首先會經由入口進入時光隧道，再駕駛時光機穿梭到使用者指定的時間和地點。入口可自由訂製，例如：哆啦A夢選用的是大雄書桌抽屜，哆啦美選用的是房間的鏡子。

                          時光機和其他時間機器的差別是：它同時具有空間和時間移動能力，所以地點選擇功能十分重要。

                          """),
      Gadget(id:3,name: "任意門", image: "gadget_AnywhereDoor",
             description: """
                          
                          使用者握住門把同時，敘說或腦中想著要去的地方。這樣裡頭的電腦便會啟動搜索，門另一邊就會將兩地聯結。打開之後就可跨越兩地到目的地，但地點必須要「說明正確」才行，不然可能會到奇怪的地方。

                          該道具內建全宇宙的地圖，可以移動至任何地方，不過其距離限制是10光年，大長篇《宇宙漂流記》提到此設定： 由於一行人降落所在星球距離地球20光年，所以無法透過任意門回到地球。

                          """),
      Gadget(id:4,name: "縮小燈", image: "gadget_SmallLight",
             description: """
                          
                          外型類似一般手電筒。用其光線照射，便可以用來縮小物體的體積與重量，再照一次便恢復原狀，是個十分實用的道具。不過有時間限制，若不持續照射，一陣子後仍會恢復原狀。


                          """),
      Gadget(id:5,name: "放大燈", image: "gadget_BigLight",
             description: """
                          
                          外型類似一般手電筒，但與縮小燈功能相反。原作早期外型設計因與縮小燈相似容易搞混，後來為了區分在動畫中就將燈頭鏡片就從圓形改成方型。

                          """),
      Gadget(id:6,name: "時光電視", image: "gadget_TimeTV",
             description: """
                          
                          其外型為一台小電視，可調整任何時間地點，從這台電視上看到過去與未來的時間的任何事物!早期的故事中，時光電視不僅可以從銀幕上看，還可以將未來的事映照成立體影像。

                          時光電視一定要知道確切的地方、時間才能使用，像是在〈鯨魚與夢幻的水管島〉中，大雄想用時光電視找比托的出生地，但因不知何時何地所以沒辦法。

                          """),
      Gadget(id:7,name: "時光包巾", image: "gadget_TimeCloth",
             description: """
                          
                          它看上去很像一塊普通正方形布料，上邊印有大小不一的時鐘圖案。有正反兩面，分別有不同顏色（漫畫中正面為灰色，反面為白色;動畫中則是紅色與藍色）。

                          當以正面朝外覆蓋某樣物體之後，被覆蓋的物體時間將會倒轉，呈現出過去狀態；若以反面朝外覆蓋，則被覆蓋的物體時間流逝速度將會加快，呈現出未來狀態。

                          使用在人身上時，被使用人的思想記憶不會因身體變回從前而消失。

                          """),
      Gadget(id:8,name: "穿透環", image: "gadget_PassLoop",
             description: """
                          
                          只要把它放在牆壁上，就能輕鬆的穿越牆壁。其不僅可以直線進行，甚至可以根據牆壁的形狀彎曲而在牆的另一面甚至地面出來。此道具常用在冒險時逃離危險之用。

                          """),
      Gadget(id:9,name: "翻譯蒟蒻", image: "gadget_TranslationTool",
             description: """
                          
                          使用者可選擇自行食用或拿給對方食用，吃下去後可與不同語言（包括外星人語言/平行世界語言）的對方正常溝通。原理如〈搬家到鬼城〉中哆啦A夢給出的解釋為：對方講的德語會變成日語，我們講的日語也會變成德語。

                          """),
      Gadget(id:10,name: "如果電話亭", image: "gadget_What-IfPhoneBooth",
             description: """
                          
                          功能是一個實驗室，外型很像電話亭。使用者向亭內的電話講出心目中的幻想世界，假如電話亭便變成出其希望的樣子。

                          若是與現實改變差異過大，製造出來的世界就會獨立於現實世界之外的平行世界運作。製造出的世界只有"使用者"和"見證使用者使用的人"本身知道是平行世界。

                          """),
      Gadget(id:11,name: "換衣相機", image: "gadget_Dress-UpCamera",
             description: """
                          
                          為一台照相機，將衣服的圖片放入之後幫人照相，那個人就會瞬間穿上照片中的衣服。如果裡面沒放圖片的話，被照的人就會變成沒穿衣服。

                          """),
      Gadget(id:12,name: "醫生皮箱", image: "gadget_doctorSuitcase",
             description: """
                          
                          其原本是未來世界小孩玩醫生遊戲的道具，但效果其實很好。只要將醫生皮箱裡的聽診器放在病人的肚子或其他患部上上一聽，這個皮箱就會知道你得到了什麼病，然後，就會開藥給你吃，藥一吃完病人的病馬上就好了！

                          """),
      Gadget(id:13,name: "立體放映機", image: "gadget_StereoscopicProjector",
             description: """
                          
                          可播放出立體影像，其逼真程度有如身歷其境。

                          """),
      Gadget(id:14,name: "格列佛隧道", image: "gadget_GulliverTunnel",
             description: """
                          
                          外型為一邊開口大一邊開口小的隧道，大的一邊約當一般人高度，人從大的一邊進入，從小的一邊出來，就會變成小人，再倒著走回去就會恢復原狀，但如果走錯方向再次從大的一邊進入的話就會變得更小。

                          該道具雖與縮小燈的功能有些重複，但仍不時會出現。

                          """),
      Gadget(id:15,name: "空氣砲", image: "gadget_AirCannon",
             description: """
                          
                          呈圓筒狀，內為空心，套在手上喊「碰」就會發射出空氣的壓力攻擊敵人，在冒險故事尤其大長篇中尤其經常出現。

                          """),
      Gadget(id:16,name: "宇宙救生艇", image: "gadget_SpaceLifeboat",
             description: """
                          
                          外形像一個火箭，以噴射引擎為動力，然後在太空進行空間跳躍。

                          原本的作用是在地球發生災難時逃難之用，也可以自動尋找人能生存的星球。

                          """),
      Gadget(id:17,name: "取物皮包", image: "gadget_fetchLeatherBag",
             description: """
                          
                          外型為一皮包，手伸進去就能從任何地方取得需要的各種東西和道具。

                          """),
      Gadget(id:18,name: "凝雲瓦斯", image: "gadget_CondensedCloudGas",
             description: """
                          
                          是一種可以將雲凝固，但又不會掉落的瓦斯氣體，讓人能站在雲上活動。

                          """),
      Gadget(id:19,name: "石頭帽", image: "gadget_PebbleHat",
             description: """
                          
                          使用者戴了它以後，雖然實際上不能真正隱身，但會變得像路邊小石頭一樣沒人理會，因此實際上比隱身功能更完整（其他人不只看不到，聽、嗅或接觸到都會有感覺但純粹不理會)，帽子碰到水後容易脫落。

                          """),
      Gadget(id:20,name: "鼴鼠手套", image: "gadget_MoleGloves",
             description: """
                          
                          專門挖地的手套，此道具的構想來自鼴鼠的手，戴上之後便能很輕鬆地在地上挖洞。

                          """),

    ]
}
  struct GadgetRow: View {
      let gadget:Gadget
      var body: some View {
          HStack{
              Image(gadget.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 50, height: 50)
                  .clipShape(Rectangle())
              Divider()
              Text(gadget.name)
                  .font(.custom(FontStyle.name, size: 24))
          }
      }
  }
