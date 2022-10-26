//
//  MovieUIView.swift
//  ioshw2_00857039
//
//  Created by User20 on 2022/10/23.
//

import SwiftUI

struct MovieUIView: View {
    
    var body: some View {
        List{
          Section(header:Text("3D電影").font(.custom(FontStyle.name, size: 24))){
              ScrollView(){
                  let columns = Array(repeating: GridItem(), count: 2)
                  LazyVGrid(columns: columns) {
                      ForEach(MovieBlockSubView.threeDMovies){movie in
                          Link(destination: URL(string: movie.url)!, label: {
                              MovieBlockSubView(movie: movie)
                          })
                      }
                  }
              }
          }
            Section(header:Text("動畫電影").font(.custom(FontStyle.name, size: 24))){
                ScrollView(){
                    let columns = Array(repeating: GridItem(), count: 2)
                    LazyVGrid(columns: columns) {
                        ForEach(MovieBlockSubView.normalMovies){movie in
                            Link(destination: URL(string: movie.url)!, label: {
                                MovieBlockSubView(movie: movie)
                            })
                        }
                    }
                }
            }

        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("電影")
                    .font(.custom(FontStyle.name, size: 20))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieUIView()
    }
}

struct Movie:Identifiable{
    let id = UUID()
    let name:String
    let image:String
    let age:String
    let url:String
}

struct MovieBlockSubView: View {
    static let frameWidth = UIScreen.main.bounds.width/2.8
    static let frameheight = frameWidth * 1.4
    
    @State private var isShowing: Bool = false
  
    let id = UUID()
    let movie:Movie
    var body: some View {
        VStack{
            Image(movie.image)
                .resizable()
                .scaledToFit()
              .frame(width:MovieBlockSubView.frameWidth, height: MovieBlockSubView.frameheight)
                .overlay(Rectangle()
                          .stroke(Color.green, lineWidth: 5)
                )
            HStack{
                Image("characterBlockBell")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(movie.name)
                    .font(.custom(FontStyle.name, size: 15))
                    .offset(x: -5)
            }
          Text("(\(movie.age))")
              .font(.custom(FontStyle.name, size: 16))
        }
        .scaleEffect(isShowing ? 1: 0)
        .opacity(isShowing ? 1: 0)
        .animation(Animation.easeInOut(duration: 0.5), value: isShowing)
        .onAppear {
            self.isShowing = true
        }
    }
}
extension MovieBlockSubView{
    static let normalMovies = [
      Movie(name: "大雄的恐龍", image: "movie_1980", age: "1980",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%81%90%E9%BE%8D"),
      
      Movie(name: "大雄的宇宙開拓史", image: "movie_1981", age: "1981",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E9%96%8B%E6%8B%93%E5%8F%B2"),
      
      Movie(name: "大雄的大魔境", image: "movie_1982", age: "1982",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%A4%A7%E9%AD%94%E5%A2%83"),
      
      Movie(name: "大雄的海底鬼岩城", image: "movie_1983", age: "1983",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%B5%B7%E5%BA%95%E9%AC%BC%E5%B2%A9%E5%9F%8E"),
      
      Movie(name: "大雄的魔界大冒險", image: "movie_1984", age: "1984",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E9%AD%94%E7%95%8C%E5%A4%A7%E5%86%92%E9%9A%AA"),
     
      Movie(name: "大雄的宇宙小戰爭", image: "movie_1985", age: "1985",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E5%B0%8F%E6%88%B0%E7%88%AD"),
     
      Movie(name: "大雄與鐵人兵團", image: "movie_1986", age: "1986",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E9%90%B5%E4%BA%BA%E5%85%B5%E5%9C%98"),
     
      Movie(name: "大雄與龍之騎士", image: "movie_1987", age: "1987",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%A4%A7%E9%AD%94%E5%A2%83"),
     
      Movie(name: "大雄的平行西遊記", image: "movie_1988", age: "1988",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%B9%B3%E8%A1%8C%E8%A5%BF%E9%81%8A%E8%A8%98"),
     
      Movie(name: "大雄的日本誕生", image: "movie_1989", age: "1989",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%97%A5%E6%9C%AC%E8%AA%95%E7%94%9F"),
      
      Movie(name: "大雄與動物行星", image: "movie_1990", age: "1990",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E5%8B%95%E7%89%A9%E8%A1%8C%E6%98%9F"),
      
      Movie(name: "大雄的天方夜譚", image: "movie_1991", age: "1991",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%A4%A9%E6%96%B9%E5%A4%9C%E8%AD%9A"),
      
      Movie(name: "大雄與雲之王國", image: "movie_1992", age: "1992",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E9%9B%B2%E4%B9%8B%E7%8E%8B%E5%9C%8B"),
      
      Movie(name: "大雄與白金迷宮", image: "movie_1993", age: "1993",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E7%99%BD%E9%87%91%E8%BF%B7%E5%AE%AE"),
      
      Movie(name: "大雄與夢幻三劍士", image: "movie_1994", age: "1994",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E5%A4%A2%E5%B9%BB%E4%B8%89%E5%8A%8D%E5%A3%AB"),
      
      Movie(name: "大雄的創世日記", image: "movie_1995", age: "1995",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%89%B5%E4%B8%96%E6%97%A5%E8%A8%98"),
      
      Movie(name: "大雄與銀河超特急", image: "movie_1996", age: "1996",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E9%8A%80%E6%B2%B3%E8%B6%85%E7%89%B9%E6%80%A5"),
      
      Movie(name: "大雄的發條都市冒險記", image: "movie_1997", age: "1997",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E7%99%BC%E6%A2%9D%E9%83%BD%E5%B8%82%E5%86%92%E9%9A%AA%E8%A8%98"),
      
      Movie(name: "大雄的南海大冒險", image: "movie_1998", age: "1998",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%8D%97%E6%B5%B7%E5%A4%A7%E5%86%92%E9%9A%AA"),
      
      Movie(name: "大雄的宇宙漂流記", image: "movie_1999", age: "1999",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E6%BC%82%E6%B5%81%E8%A8%98"),
      
      Movie(name: "大雄的太陽王傳說", image: "movie_2000", age: "2000",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%A4%AA%E9%99%BD%E7%8E%8B%E5%82%B3%E8%AA%AA"),
      
      Movie(name: "大雄與翼之勇者們", image: "movie_2001", age: "2001",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E7%BF%BC%E4%B9%8B%E5%8B%87%E8%80%85%E5%80%91"),
      
      Movie(name: "大雄與機器人王國", image: "movie_2002", age: "2002",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E6%A9%9F%E5%99%A8%E4%BA%BA%E7%8E%8B%E5%9C%8B"),
      
      Movie(name: "大雄與不可思議的風使者", image: "movie_2003", age: "2003",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E4%B8%8D%E5%8F%AF%E6%80%9D%E8%AD%B0%E7%9A%84%E9%A2%A8%E4%BD%BF%E8%80%85"),
      
      Movie(name: "大雄的貓狗時空傳", image: "movie_2004", age: "2004",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E8%B2%93%E7%8B%97%E6%99%82%E7%A9%BA%E5%82%B3"),
      
      Movie(name: "大雄的恐龍2006", image: "movie_2006", age: "2006",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%81%90%E9%BE%8D2006"),
      
      Movie(name: "大雄的新魔界大冒險", image: "movie_2007", age: "2007",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%96%B0%E9%AD%94%E7%95%8C%E5%A4%A7%E5%86%92%E9%9A%AA"),
      
      Movie(name: "大雄與綠之巨人傳", image: "movie_2008", age: "2008",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E7%B6%A0%E4%B9%8B%E5%B7%A8%E4%BA%BA%E5%82%B3"),
      
      Movie(name: "新．大雄的宇宙開拓史", image: "movie_2009", age: "2009",
            url: "https://doraemon.fandom.com/zh/wiki/%E6%96%B0%EF%BC%8E%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E9%96%8B%E6%8B%93%E5%8F%B2"),
      
      Movie(name: "大雄的人魚大海戰", image: "movie_2010", age: "2010",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E4%BA%BA%E9%AD%9A%E5%A4%A7%E6%B5%B7%E6%88%B0"),
      
      Movie(name: "新·大雄與鐵人兵團", image: "movie_2011", age: "2011",
            url: "https://doraemon.fandom.com/zh/wiki/%E6%96%B0%C2%B7%E5%A4%A7%E9%9B%84%E8%88%87%E9%90%B5%E4%BA%BA%E5%85%B5%E5%9C%98"),
      
      Movie(name: "大雄與奇跡之島", image: "movie_2012", age: "2012",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E5%A5%87%E8%B7%A1%E4%B9%8B%E5%B3%B6"),
      
      Movie(name: "大雄的秘密道具博物館", image: "movie_2013", age: "2013",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E7%A7%98%E5%AF%86%E9%81%93%E5%85%B7%E5%8D%9A%E7%89%A9%E9%A4%A8"),
      
      Movie(name: "新・大雄的大魔境", image: "movie_2014", age: "2014",
            url: "https://doraemon.fandom.com/zh/wiki/%E6%96%B0%E3%83%BB%E5%A4%A7%E9%9B%84%E7%9A%84%E5%A4%A7%E9%AD%94%E5%A2%83%EF%BD%9E%E4%BD%8E%E9%A0%AD%E8%88%87%E4%BA%94%E4%BA%BA%E6%8E%A2%E9%9A%AA%E9%9A%8A%EF%BD%9E"),
      
      Movie(name: "大雄的宇宙英雄記", image: "movie_2015", age: "2015",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E8%8B%B1%E9%9B%84%E8%A8%98"),
      
      Movie(name: "新・大雄的日本誕生", image: "movie_2016", age: "2016",
            url: "https://doraemon.fandom.com/zh/wiki/%E6%96%B0%E3%83%BB%E5%A4%A7%E9%9B%84%E7%9A%84%E6%97%A5%E6%9C%AC%E8%AA%95%E7%94%9F"),
      
      Movie(name: "大雄的南極冰天雪地大冒險", image: "movie_2017", age: "2017",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%8D%97%E6%A5%B5%E5%86%B0%E5%A4%A9%E9%9B%AA%E5%9C%B0%E5%A4%A7%E5%86%92%E9%9A%AA"),
      
      Movie(name: "大雄的金銀島", image: "movie_2018", age: "2018",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E9%87%91%E9%8A%80%E5%B3%B6"),
      
      Movie(name: "大雄的月球探測記", image: "movie_2019", age: "2019",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%9C%88%E7%90%83%E6%8E%A2%E6%B8%AC%E8%A8%98"),
      
      Movie(name: "大雄的新恐龍", image: "movie_2020", age: "2020",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%96%B0%E6%81%90%E9%BE%8D"),
      
      Movie(name: "大雄的宇宙小戰爭2021", image: "movie_2021", age: "2021",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E5%AE%87%E5%AE%99%E5%B0%8F%E6%88%B0%E7%88%AD2021"),
      
      Movie(name: "大雄與天空之理想鄉", image: "movie_2023", age: "2023",
            url: "https://doraemon.fandom.com/zh/wiki/%E5%A4%A7%E9%9B%84%E8%88%87%E5%A4%A9%E7%A9%BA%E4%B9%8B%E7%90%86%E6%83%B3%E9%84%89")
      

    ]
    static let threeDMovies = [
      Movie(name: "STAND BY ME", image: "movie_3D_2014", age: "2014",
            url: "https://doraemon.fandom.com/zh/wiki/STAND_BY_ME_%E5%93%86%E5%95%A6A%E5%A4%A2"),
      
      Movie(name: "STAND BY ME 2", image: "movie_3D_2020", age: "2020",
            url: "https://doraemon.fandom.com/zh/wiki/STAND_BY_ME_%E5%93%86%E5%95%A6A%E5%A4%A2_2"),
    ]
    
}
