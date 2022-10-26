//
//  CharacterUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/8.
//

import SwiftUI

struct CharacterUIView: View {
    var body: some View {
        List{
          Section(header:Text("主要角色").font(.custom(FontStyle.name, size: 24))){
                ScrollView(.horizontal,showsIndicators: false){
                    let rows = [GridItem()]
                    LazyHGrid(rows: rows) {
                        ForEach(CharacterBlockSubView.mainCharacters){character in
                            NavigationLink(
                                destination: CharacterDetailUIView(character: character),
                                label: {
                                  CharacterBlockSubView(charactor: character,isMainCharacter:true)
                            })
                        }
                    }
                }
            }
            Section(header:Text("常見配角").font(.custom(FontStyle.name, size: 24))){
                ScrollView(showsIndicators: false){
                    let columns = Array(repeating: GridItem(), count: 3)
                    LazyVGrid(columns: columns) {
                        ForEach(CharacterBlockSubView.supportingCharacters){character in
                            NavigationLink(
                                destination: CharacterDetailUIView(character: character),
                                label: {
                                    CharacterBlockSubView(charactor: character,isMainCharacter:false)
                                })
                        }
                    }
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("角色")
                    .font(.custom(FontStyle.name, size: 20))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterUIView()
                .preferredColorScheme(.dark)
            CharacterUIView()
        }
    }
}

struct Character:Identifiable {
    let id = UUID()
    let name:String         //角色名稱
    let thumbnail:String    //角色介紹頁面縮圖
    var pictures:[String]    //角色詳細介紹頁面圖(用於scroll and lazyHgrid)
    let description:String  //角色介紹內文
}

struct CharacterBlockSubView: View {
    let id = UUID()
    let charactor:Character
    let isMainCharacter:Bool
    
    @State private var isShowing: Bool = false
    
    var body: some View {
        
        VStack{
            if(isMainCharacter == true){//主要角色
                Image(charactor.thumbnail)
                    .resizable()
                   .frame(width:UIScreen.main.bounds.width/2.8 , height: UIScreen.main.bounds.height / 4)
                    .mask(Image("characterBlockMask")
                            .resizable()
                            .scaledToFit())
                    .overlay(Image("characterBlockFrameMask")
                            .resizable()
                            .scaledToFit())
            }else{
                //常見配角
                Image(charactor.thumbnail)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/4 )
                    .mask(Image("characterBlockMask")
                            .resizable()
                            .scaledToFit())
                    .overlay(Image("characterBlockFrameMask")
                            .resizable()
                            .scaledToFit())
            }
            HStack{
            Image("characterBlockBell")
              .resizable()
              .frame(width: 16, height: 16)
            Text(charactor.name)
              .font(.custom(FontStyle.name, size: 16))
              .offset(x: -5)
            }
        }
        .scaleEffect(isShowing ? 1: 0)
        .opacity(isShowing ? 1: 0)
        .animation(Animation.easeInOut(duration: 0.3), value: isShowing)
        .onAppear {
            self.isShowing = true
        }
    }
}
extension CharacterBlockSubView {
    static let mainCharacters = [
      Character(name: "哆啦Ａ夢", thumbnail: "CharactorThumbnail_哆啦A夢",
                pictures: ["pictures_哆啦A夢_1","pictures_哆啦A夢_2","pictures_哆啦A夢_3"],
                description: """

                            哆啦A夢（日語：ドラえもん，英語：Doraemon），名字的意思是銅鑼（ドラ）衞門（えもん），本作的主人公。

                            哆啦A夢來自於22世紀，為當時批量生產的貓型育兒機器人之一，其型號為MS-903。由於耳朵被老鼠吃掉，因此十分害怕老鼠。

                            其性情溫和，有時表現出正經，但不時會有脫線的表現，有助人的熱心但常會犯錯。最愛吃的東西是銅鑼燒，平常興趣包括和喜歡的貓聚會聊天，也會看漫畫、看電視。

                            哆啦A夢胸前有一個百寶袋，內有各種未來的法寶。因應不同需要，哆啦A夢可以隨時拿出想要的東西（不過在緊張驚慌的時候，哆啦A夢會找不到想要的道具翻出一大堆派不上用場的道具）。

                            受大雄玄孫世修所託，平時的職責是照顧野比大雄，每當大雄需要幫助，哆啦A夢就會將道具借給大雄，然而通常最後都不會有好下場。

                            """),
        Character(name: "大雄", thumbnail: "CharactorThumbnail_大雄",
                  pictures:["pictures_大雄_1","pictures_大雄_2","pictures_大雄_3"],
                  description: """

                                本名為野比大雄(日語：野比のび太)，本作的主要角色之一。

                                大雄的優點是有責任心且善良正直，是一個“為別人的不幸而傷心，會祈求別人幸福的人”，而他的缺點是性格懦弱，膽小怕事，丟三落四。哆啦A夢即是由野比大雄的玄孫野比世修派來幫助他、挖掘他的潛質，並扭轉他不幸的命運的重要夥伴。

                                平時喜歡睡午覺、看漫畫、電視、翻花繩等，不喜歡讀書寫功課，每次放學也是直接跑出去玩，因此經常考零鴨蛋而被媽媽責罵。

                                此外，他是《哆啦A夢》中出場次數最多的角色，比哆啦A夢還高，也是整部作品最早登場的角色，由於整個故事都由大雄生活發展而來，所以說大雄是真正的主角也不為過；作者曾說過，大雄的許多平凡沒用的特性是他小時候的寫照。

                                """),
 
        Character(name: "靜香", thumbnail: "CharactorThumbnail_靜香",
                  pictures: ["pictures_靜香_1","pictures_靜香_2","pictures_靜香_3"],
                  description: """

                                本名源靜香(日語：源 靜香)，本作的主要角色之一。

                                靜香個性溫柔善良、有正義感，經常幫助受欺負的大雄，平日言行舉止端莊、文靜有禮貌，在緊急狀況也有獨立堅強的一面。但有時候容易生氣且任性，有輕微潔癖，平常沒事就喜歡洗澡，因此也經常發生被大雄撞見的尷尬情況。

                                靜香的成績優秀，擅長各類家政手藝（尤其是烘焙和織衣服），也擅長彈鋼琴，不過小提琴才是她本人的興趣（雖然拉得很難聽，幾可與胖虎唱歌並列），除此之外，她最喜歡吃的食物是烤地瓜，但因為吃了這個以後容易放屁，為此覺得尷尬。

                                靜香是大雄喜歡的女生，因此與同班同學出木杉之間頻繁的互動時，會讓大雄感到嫉妒，然而她在未來卻是大雄的妻子。

                                """),
        Character(name: "小夫", thumbnail: "CharactorThumbnail_小夫",
                  pictures: ["pictures_小夫_1","pictures_小夫_2","pictures_小夫_3"],
                  description: """

                                本名骨川小夫（日語：骨川 スネ夫），本作的主要角色之一。

                                小夫非常喜歡炫耀，時常善用家庭財力來蒐集自己喜歡的東西，讓別人非常嫉妒。嘴巴非常善於奉承，擅長贊揚女孩子。平時喜歡與胖虎一起欺負大雄，邀請別人的時候經常說「只有大雄不行」，有時也用哆啦A夢的道具來惡作劇。亦經常識破或暗中察覺大雄的惡作劇與道具的秘密。

                                自滿的小夫唯一煩惱是身高太矮小，身高比大雄還矮，因此而強烈自卑。

                                愛好是塑膠模型製作、無線電和漫畫。也喜歡讀書、電視遊戲、攝影、動畫製作、集郵等，可以說興趣相當豐富多彩。此外也對流行敏感。可以說是心靈手巧，夢想是成為流行服飾的設計師。

                                """),
        Character(name: "胖虎", thumbnail: "CharactorThumbnail_胖虎",
                  pictures: ["pictures_胖虎_1","pictures_胖虎_2","pictures_胖虎_3"],
                  description: """

                                本名剛田武（日語：剛田 武），本作的主要角色之一。

                                胖虎在同年齡中是孩子王般的存在，經常仗著自己的力量欺負其他孩子，尤其是大雄。但他非常害怕媽媽，因為做錯事而被打罵。除此之外，他經常「借」了別人的東西卻不歸還，也因此誕生出「你的東西就是我的東西，我的東西還是我的東西」這句經典台詞。

                                胖虎也不是毫無優點，雖然他愛欺負人，但有時候有勇氣和正義感，遇上壞人或緊急情形時也會挺身而出，而且他非常疼愛自己的妹妹小珠，因此絕不會放過欺負她的人。

                                胖虎最愛唱歌，他的志願是成為歌手，還為此經常邀請其他人參加他的演唱會，然而他的歌聲十分可怕，因此令眾人避之唯恐不及。他的另外一個興趣是棒球，並為此創立胖虎棒球隊，對於犯錯的隊員會責打他，特別是經常三振出局的大雄。

                                """)
    ]
    static let supportingCharacters = [
        Character(name: "小杉", thumbnail: "CharactorThumbnail_小杉",
                  pictures: ["pictures_小杉_1","pictures_小杉_2","pictures_小杉_3"],
                  description: """

                                本名出木杉英才（日語：出木杉 英才），本作的常見配角之一。

                                小杉是大雄的同學之一，其特色是各方面的完美，個性謙和、待人和善與正直，頭腦聰明，知識豐富好學，經長考班上的第一名，也擅長體育，其體能幾乎不輸胖虎。

                                對人很和善，尤其與靜香關係最密切，也喜歡靜香，常在一起研究功課、交換日記等。靜香對他也有一定好感，也因此讓大雄將之視為最大情敵，然而小杉似乎並未察覺，還是對大雄很好。
                                
                                """),
        Character(name: "哆啦美", thumbnail: "CharactorThumbnail_哆啦美",
                  pictures: ["pictures_哆啦美_1","pictures_哆啦美_2"],
                  description: """

                                哆啦美（日語：ドラミ），本作的常見配角之一。

                                哆啦美是哆啦A夢的妹妹，也是一隻機器貓。她性情溫和、聰明、愛乾淨、力氣大，很擅長處理家政方面的事務。

                                哆啦美和哆啦A夢一樣服務於野比家族，在哥哥前去照顧大雄後，就接替他照顧世修，偶爾還會暫代哆啦A夢來照顧大雄，讓哥哥能回去檢查身體或是處理要事。在一些大長篇中，她的出現經常成為大雄一行人的轉機。

                                哆啦A夢和哆啦美之所以為兄妹，早期設定是因製造哆啦A夢的博士在製作哆啦美時，使用與哆啦A夢同一罐機油，但因為博士忘記事先搖晃均勻，所以她使用到的部分恰巧是下層經過沉澱較濃的油料，因此性能較哆啦A夢好。後來原因被修改為哆啦美是專門出於輔助目的而製造的妹妹型機器人。

                                """),
        Character(name: "世修", thumbnail: "CharactorThumbnail_世修",
                  pictures: ["pictures_世修_1","pictures_世修_2","pictures_世修_3"],
                  description: """

                                本名野比世修（日語：セワシ），本作的常見配角之一。

                                他是大雄的玄孫，也是哆啦A夢最早的主人。長像類似大雄但未戴眼鏡，且頭腦應比大雄好，與大雄同年齡的他個性也較成熟穩重。

                                來到20世紀遇到大雄時稱呼其為爺爺，但大雄似乎不喜歡他這樣稱呼，同樣在靜香面前直接稱呼她奶奶，靜香也說他沒禮貌。

                                根據早期設定，哆啦A夢是因製作的不好，成為拍賣品，然後被世修家買下照顧世修，後來改為嬰兒的世修不小心在機器人選拔會上按錯鈕，因此哆啦A夢才到世修家。

                                """),
        Character(name: "小珠", thumbnail: "CharactorThumbnail_小珠",
                  pictures: ["pictures_小珠_1","pictures_小珠_2"],
                  description: """

                                小珠（日語：ジャイ子），本作的常見配角之一。

                                她是胖虎的妹妹，故事早期較為兇悍粗魯，會向哥哥告狀說誰欺負她，故事後期她開始發揮繪畫天份，夢想當個漫畫家，個性也變得較為文靜多愁善感。另外其投稿發表漫畫的筆名叫克莉絲汀娜剛田（クリスチーネ剛田）。

                                在哆啦A夢尚未來到大雄家之前，原先時空的大雄本來未來會娶她作太太，婚後還會生至少六個小孩，她會變得非常胖，而且家裡會很窮，但哆啦A夢來了之後改變了兩人的命運。

                                """),
        Character(name: "大雄媽媽", thumbnail: "CharactorThumbnail_大雄媽媽",
                  pictures: ["pictures_大雄媽媽_1","pictures_大雄媽媽_2"],
                  description: """

                                本名野比玉子（日語：野比玉子），舊姓片岡，本作的常見配角之一。

                                野比玉子與大雄一樣戴著眼鏡且近視頗深。雖身材並不胖，但卻常常覺得自己胖而想要減肥，然後情緒不穩而對家人出氣。除此之外非常討厭小動物，因此禁止大雄在家養寵物。

                                平常主要負責家計和家事，對幼年大雄比較寬鬆，長大後轉為嚴格。常因成績或其他大小事（太晚回家、把房間弄得很亂等等）而責罵他，說教常常一次達一兩個小時以上（動畫中有時會在開始前伴隨打雷或讓她轉變成魔鬼模式），甚至會和老師一起對大雄說教，但有時也有對大雄溫柔的一面。

                                玉子經常不幸成為大雄使用道具的實驗對象，但有時也會利用道具反過來監視大雄行動。

                                """),
        Character(name: "大雄爸爸", thumbnail: "CharactorThumbnail_大雄爸爸",
                  pictures: ["pictures_大雄爸爸_1","pictures_大雄爸爸_2"],
                  description: """

                                本名野比大助（日語：野比のび助），本作的常見配角之一。

                                朝九晚五的典型上班族，曾經有抽菸的不良嗜好，愛喝酒，有時應酬會喝酒喝個爛醉回家而被老婆教訓喜歡，喜歡打小鋼珠，閒時愛看電視，其中常看棒球和高爾夫球比賽。

                                對於音樂也甚喜好，戶外活動方面愛去釣魚和打高爾夫球，有時會想出去鍛煉，但又堅持不下來，因此被老婆嘲笑只有三分鐘熱度。

                                雙親中他較寵大雄，雖然偶爾也會有很長的說教，但一般比較少罵或管教大雄。

                                """),
        Character(name: "靜香媽媽", thumbnail: "CharactorThumbnail_靜香媽媽",
                  pictures: ["pictures_靜香媽媽_1","pictures_靜香媽媽_2"],
                  description: """

                                本名不詳，本作的常見配角之一。

                                靜香媽媽的外型與靜香相像，她的性格和善，但在教育靜香方面不時很嚴厲，有時也會斥責靜香，另外要求靜香學鋼琴這點常為靜香所不滿，還曾經因為鋼琴的事罵了靜香，讓靜香很難過。

                                對她來說最重要的東西是丈夫送給她價值300萬日圓的珍珠項鏈，在附篇電影《大雄的結婚前夜》中，在婚前告別晚宴結束後她把項鏈正式傳給了靜香。

                                靜香的媽媽出現次數很多，尤其常在大雄到靜香家造訪而靜香不在時登場。
                                
                                """),
        Character(name: "小夫媽媽", thumbnail: "CharactorThumbnail_小夫媽媽",
                  pictures: ["pictures_小夫媽媽_1","pictures_小夫媽媽_2"],
                  description: """

                                本名不詳，本作的常見配角之一。

                                小夫媽媽外型與小夫和小夫的爸爸類似，個性也同樣愛慕虛榮，喜歡向其他的太太（如大雄的媽媽）炫耀，也很熱衷上電視等出鋒頭的機會。另外雖然會使用名貴的東西，但同時又貪小便宜。

                                對小夫頗溺愛，例如給他很多零用錢，吃好吃的點心。但另一方面對小夫的教育也頗為嚴格，例如讓小夫去上很多科目的補習班，或請家庭教師到家裡。

                                """),
        Character(name: "胖虎媽媽", thumbnail: "CharactorThumbnail_胖虎媽媽",
                  pictures: ["pictures_胖虎媽媽_1","pictures_胖虎媽媽_2"],
                  description: """

                                本名不詳，本作的常見配角之一。

                                她是是胖虎和小珠的媽媽，剛田雜貨店的店主。是胖虎極少數害怕的其中一人，對於偷懶或欺負同學的胖虎常常是叱責，甚至也常常打他，但也有對胖虎友善的時候。

                                相較於其他女性角色，她不太愛用女性用語，且漫畫早期與後期形象也有所不同。

                                """),
        Character(name: "老師", thumbnail: "CharactorThumbnail_老師",
                  pictures: ["pictures_老師_1","pictures_老師_2"],
                  description: """

                                原著本名不詳，大山版動畫姓先生名榮一郎，本作的常見配角之一。

                                他是大雄班級的導師，對於遲到或未寫作業的學生會責罵或罰站，有時會沒收學生的東西，但也不時激勵學習不佳的大雄，表現好也不忘稱讚。此外要是讓他看到、聽到不符合常識的想法、事情，亦會出面加以糾正。

                                大雄很怕老師來做家庭訪問，因為老師每次過來多半是指責大雄的缺點，如測驗0分或不專心聽課，有時還會跟大雄媽媽一起指責大雄。

                                除了在上課時會出現外，大雄等人在街上也常常會不時遇到老師，也因此偶爾逮到鬼混的學生。

                                """),
        Character(name: "神成", thumbnail: "CharactorThumbnail_神成",
                  pictures: ["pictures_神成_1","pictures_神成_2"],
                  description: """

                                又稱雷公，本作的常見配角之一。

                                由於他家在大雄他們常打棒球之空地隔壁，因此大雄他們常不小心用棒球、石頭等打壞他家玻璃或盆栽，結果被他發現後總是大雄負責道歉善後。
                                
                                人們因為他待人很兇而稱作雷公伯伯，有趣的是「神成」與「雷」在日文中發音相同。

                                """),
        Character(name: "迷你哆啦", thumbnail: "CharactorThumbnail_迷你哆啦",
                  pictures: ["pictures_迷你哆啦_1","pictures_迷你哆啦_2"],
                  description: """

                                迷你哆啦（日語：ミニドラ），本作的常見配角之一。

                                迷你哆啦嚴格來說也算是哆啦A夢的一個道具，身高30cm，是貓型機器人的迷你版。通常待在哆啦A夢的四次元口袋，而哆啦A夢的常用道具，迷你哆啦也有迷你版，但太小不適合人類使用。

                                迷你哆啦有六種顏色（紅、粉、黃、綠、淺藍、紫），大長篇《大雄的金銀島》後多了一個橘色，其中出現最多次的是紅色，其次是黃色和綠色。

                                跟哆啦A夢一樣，最喜歡吃銅鑼燒，對其他美食同樣無法抗拒，也因此被大雄利用。

                                他們只會說迷你哆啦語，動畫中他們互相溝通或跟外人對話時只會說「哆啦、哆啦啦、叮叮噹」等，哆啦A夢與哆啦美能聽得懂，不過大雄等人需要服用翻譯蒟蒻才能聽懂。

                                """),
        Character(name: "安雄&春夫", thumbnail: "CharactorThumbnail_安雄&春夫",
                  pictures: ["pictures_安雄&春夫_1","pictures_安雄&春夫_2"],
                  description: """

                                安雄（日語：安雄），春夫（日語：はる夫），本作的常見配角之一。

                                原著漫畫中，兩人登場次數不低，甚至高過出木杉，春夫和安雄在作品中可說代表大雄一般男同學的角色，也是除了主角群以外，最常出現在胖虎棒球隊中的隊員。
                                
                                安雄身材較瘦，常戴著一頂帽子，春夫則是身材較胖。

                                安雄和春夫經常一起聊天、看漫畫或丟棒球。同樣很怕胖虎，而不看好大雄。
                                
                                """),
        Character(name: "大雄奶奶", thumbnail: "CharactorThumbnail_大雄奶奶",
                  pictures: ["pictures_大雄奶奶_1","pictures_大雄奶奶_2","pictures_大雄奶奶_3"],
                  description: """

                                本名不詳，是本作中的一個已故角色，經常出現在大雄或是大雄爸媽的回憶中。

                                她是一個和善慈祥的女性，在作為母親的職責與角色上比媳婦野比玉子還要來得優秀及溫柔，經常勸丈夫不要對大助太兇。在兒子大助和玉子結婚後仍住在一起，並在大雄出生時曾照顧過大雄，最後在大雄幼稚園時期去世。

                                最先出現於短篇〈懷念奶奶〉，該篇描寫了許多奶奶於大雄幼年時對他的慈祥，另外有幾次提及或回到爸爸小時候的故事，也曾出現較年輕的奶奶。
                                
                                """),
        Character(name: "動物們", thumbnail: "CharactorThumbnail_動物們",
                  pictures: ["pictures_動物們_1","pictures_動物們_2","pictures_動物們_3"],
                  description: """

                                ◾酷哥，是一隻胖虎家的黃金小獵犬寵物，牠外貌雖看起來很兇惡，力量也不小，但實際上有時很膽小，同時也是隻頗有幽默感的狗。牠的生活習慣不是很好，會在街上亂翻垃圾和隨地小便。常被胖虎欺負（要牠學雜技，如貓叫、跳肚皮舞等），且多次因不會這些技能而被胖虎拋棄。

                                ◾小皮，是靜香養的一隻金絲雀寵物，叫聲為「ピピピ」(pi pi pi )，有可能是因此而得名。牠常常會從籠子裡跑掉，讓靜香很傷腦筋，不過曾經在靜香家瓦斯管脫落的時候，發出吵鬧聲提醒，因而救了靜香一家。

                                ◾小咪，是一隻貓，是哆啦A夢在20世紀喜歡的對象，經常和哆啦A夢約會玩耍。普遍認為是哆啦A夢的女朋友。在漫畫中為一隻白貓（在大山版動畫中為灰粽色），頸上有裝飾，故應為家貓。在哆啦A夢動畫中，通常將她和另一隻哆啦A夢女朋友小玉合併為一個角色。
                                
                                """),
    ]
}

