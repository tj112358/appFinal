//
//  NewsPage.swift
//  appFinal
//
//  Created by Thea Yocum on 5/7/26.
//

import SwiftUI
import WebKit
import SwiftSoup

//format newsCard object for the news arrays
struct newsCard {
    var headline: String
    var title: String
    var image: String
    var address: String
}

struct NewsPage: View {
    //init the news array
    @State var news: [newsCard] = [
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: ""),
        newsCard(headline: "", title: "", image: "", address: "")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    //Race countdown header
                    HStack{
                        VStack{
                            Text("nextrace")
                                .font(.custom("Formula1-Display-Regular", size: 30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("SEP 19-20")
                                .font(.custom("Formula1-Display-Regular", size: 12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer()
                        //TODO: proper countdown
                        Text(Date().addingTimeInterval(600), style: .relative)
                            .font(.custom("Formula1-Display-Regular", size: 24))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.accent)
                    
                    //News cards list
                    ScrollView {
                        VStack{
                            bigNewsCard (headline: news[0].headline, title: news[0].title, img: news[0].image, address: news[0].address)
                            ForEach(1...19, id: \.self) {i in
                                smallNewsCard (headline: news[i].headline, title: news[i].title , img: news[i].image, address: news[i].address)
                            }
                        }
                    }
                    .task {
                        news = await scrapeNews() ?? [
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: ""),
                            newsCard(headline: "", title: "", image: "", address: "")
                        ]
                    }
                }
            }
        }
        
    }
}


#Preview {
    NewsPage()
}

