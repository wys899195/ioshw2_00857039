 //
//  GadgetDetailUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/23.
//

import SwiftUI

struct GadgetDetailUIView: View {
      @State var selectedTab:Int
      var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor")]), startPoint: .top, endPoint: .bottom)
            TabView(selection: $selectedTab){
            ForEach(Gadget.gedgets){gadget in
              ScrollView{
                Image(gadget.image)
                      .resizable()
                      .scaledToFit()
                      .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
                      .clipShape(Rectangle())
                Divider()
                HStack{
                    Image("characterBlockBell")
                        .resizable()
                        .frame(width: 24, height: 24)
                  Text(gadget.name)
                        .font(.custom(FontStyle.name, size: 24))
                    Image("characterBlockBell")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                Text(gadget.description)
                  .font(.custom(FontStyle.name, size: 20))
              }.tag(gadget.id)
            }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
      }
}
 

 

struct GadgetDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
      GadgetDetailUIView(selectedTab:2)
    }
}

