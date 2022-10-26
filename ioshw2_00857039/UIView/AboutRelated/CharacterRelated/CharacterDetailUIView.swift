//
//  CharacterDetailUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/8.
//

import SwiftUI

struct CharacterDetailUIView: View {
    
    var character : Character
    
    @State private var isShowing: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor")]), startPoint: .top, endPoint: .bottom)
            ScrollView(){
                  HStack{
                      Image("characterBlockBell")
                          .resizable()
                          .frame(width: 24, height: 24)
                      Text("角色動畫圖")
                        .font(.custom(FontStyle.name, size: 24))
                      Image("characterBlockBell")
                          .resizable()
                          .frame(width: 24, height: 24)
                  }
                  ScrollView(.horizontal,showsIndicators: false){
                      HStack{
                          VStack{
                              Image(character.pictures[0])
                                  .resizable()
                                  .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/1.5)
                            if(character.name != "動物們"){
                                Text("大山版（舊版）")
                                  .font(.custom(FontStyle.name, size: 20))
                            }
                            else{
                                Text("酷哥(胖虎的狗）")
                                  .font(.custom(FontStyle.name, size: 20))
                            }
                          }
                          .offset(x: isShowing ? 0: UIScreen.main.bounds.width)
                          .opacity(isShowing ? 1: 0)
                          .animation(Animation.linear(duration: 0.3), value: isShowing)
                          VStack{
                              Image(character.pictures[1])
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/1.5)
                              if(character.name != "動物們"){
                                  Text("水田版（新版）")
                                      .font(.custom(FontStyle.name, size: 20))
                              }
                              else{
                                  Text("小嗶(靜香的鳥）")
                                      .font(.custom(FontStyle.name, size: 20))
                              }
                          }
                          .offset(x: isShowing ? 0: UIScreen.main.bounds.width)
                          .opacity(isShowing ? 1: 0)
                          .animation(Animation.linear(duration: 0.3).delay(0.15), value: isShowing)
                          if(character.pictures.count == 3){
                              VStack{
                                Image(character.pictures[2])
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/1.5)
                                if(character.name != "動物們"){
                                    Text("3D版")
                                        .font(.custom(FontStyle.name, size: 20))
                                  
                                }
                                else{
                                    Text("小咪")
                                        .font(.custom(FontStyle.name, size: 20))
                                }
                            
                              }
                          }
                      }
                  }
                  .frame(height: UIScreen.main.bounds.width/1.5+30)

                  Divider()
                  HStack{
                      Image("characterBlockBell")
                          .resizable()
                          .frame(width: 24, height: 24)
                      Text("角色介紹")
                          .font(.custom(FontStyle.name, size: 24))
                      Image("characterBlockBell")
                          .resizable()
                          .frame(width: 24, height: 24)
                  }

                  Text(character.description)
                    .font(.custom(FontStyle.name, size: 20))
                  Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(character.name)
                        .font(.custom(FontStyle.name, size: 20))
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.isShowing = true
            }
        }
    }
}

struct CharacterDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailUIView(character:Character(name: "小杉", thumbnail: "CharactorThumbnail_小杉",
                                                  pictures: ["pictures_小杉_1","pictures_小杉_2","pictures_小杉_3"],
                                                  description: ""))
    }
}

