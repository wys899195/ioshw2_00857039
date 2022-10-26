//
//  AboutUIView.swift
//  ioshw2_00857039
//
//  Created by User11 on 2022/10/26.
//

import SwiftUI

struct AboutUIView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor")]), startPoint: .top, endPoint: .bottom)
        ScrollView{
            NavigationLink(
                destination: introdctionView(),
                label: {
                    ZStack{
                        Image("doraemonRaiseHand")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/3, height:UIScreen.main.bounds.width/3)
                        Text("作品簡介").offset(y:-UIScreen.main.bounds.width/15)
                            .font(.custom(FontStyle.name, size: UIScreen.main.bounds.width/15))
                            .foregroundColor(Color.black)
                    }
                }
            )
            NavigationLink(
                destination: CharacterUIView(),
                label: {
                    ZStack{
                        Image("doraemonRaiseHand")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/3, height:UIScreen.main.bounds.width/3)
                        Text("登場角色").offset(y:-UIScreen.main.bounds.width/15)
                            .font(.custom(FontStyle.name, size: UIScreen.main.bounds.width/15))
                            .foregroundColor(Color.black)
                    }
                }
            )
            NavigationLink(
                destination: GadgetUIView(),
                label: {
                    ZStack{
                        Image("doraemonRaiseHand")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/3, height:UIScreen.main.bounds.width/3)
                        Text("常見道具").offset(y:-UIScreen.main.bounds.width/15)
                            .font(.custom(FontStyle.name, size: UIScreen.main.bounds.width/15))
                            .foregroundColor(Color.black)
                    }
                }
            )
            NavigationLink(
                destination: MovieUIView(),
                label: {
                    ZStack{
                        Image("doraemonRaiseHand")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/3, height:UIScreen.main.bounds.width/3)
                        Text("電影").offset(y:-UIScreen.main.bounds.width/15)
                            .font(.custom(FontStyle.name, size: UIScreen.main.bounds.width/15))
                            .foregroundColor(Color.black)
                    }
                }
            )
            
        }.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("關於")
                    .font(.custom(FontStyle.name, size: 20))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        }
        }
    }
}

struct AboutUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUIView()
    }
}
