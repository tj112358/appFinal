//
//  newsCardStructs.swift
//  appFinal
//
//  Created by Thea Yocum on 5/7/26.
//
import SwiftUI
import WebKit
import SwiftSoup

struct smallNewsCard: View {
    var headline: String
    var title: String
    var img: String
    var address: String
    
    var body: some View {
        NavigationLink(destination: WebView(url: URL(string: address))) {
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    AsyncImage(url: URL(string: img)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 90)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15)))
                    
                    VStack(alignment: .leading){
                        Text(title .uppercased())
                            .foregroundColor(.typeface)
                            .font(.system(size: 12))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.typeface)
                            .lineLimit(3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                }
            }
            .background(Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(15)
                .foregroundColor(.card)
                        .shadow(radius: 5)
            )
            .padding(.top, 5)
            .padding(.horizontal)
        }
    }
}

struct bigNewsCard: View {
    var headline: String
    var title: String
    var img: String
    var address: String
    
    var body: some View{
        NavigationLink(destination: WebView(url: URL(string: address))) {
            ZStack{
                AsyncImage(url: URL(string: img)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
                
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text(title.uppercased())
                            .foregroundColor(.white)
                            .font(.custom("ProximaNova-Medium", size: 15))
                            
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .padding(.top, 40)
                    .background(Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.clear, .paleGray]), startPoint: .top, endPoint: .bottom))
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 15, bottomTrailing: 15)))
                    )
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 5)
            .padding(.horizontal)
            
        }
    }
}
