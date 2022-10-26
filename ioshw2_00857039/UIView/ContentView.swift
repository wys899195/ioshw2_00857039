//
//  ContentView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeUIView()
                .tabItem {
                    Label("主頁", systemImage: "house.fill")
                }
            AboutUIView()
                .tabItem {
                    Label("關於"
                          , systemImage: "questionmark")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}


