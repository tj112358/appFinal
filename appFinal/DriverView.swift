//
//  DriverView.swift
//  appFinal
//
//  Created by Thea Yocum on 5/16/26.
//

import SwiftUI
import SwiftSoup

struct DriverView: View {
    
    let driverNo: String
    @State var myDriver: driverInfo = driverInfo(firstName: "", lastName: "", image: "", flag: "", carno: "", seasonPos: "", seasonPts: "", team: "", supportedBy: "", dob: "", bio: "", nationality: "")
    
    var body: some View {
        ScrollView {
            ZStack {
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (spacing: 0) {
                        
                        //This is the biopic at the top and the nameing
                        ZStack{
                            GeometryReader { proxy in
                                AsyncImage(url: URL(string: myDriver.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                //TODO: fix magic number
                                .frame(width: proxy.size.width, height: 285) //275
                            }
                            VStack{
                                Spacer()
                                VStack{
                                    Text(myDriver.firstName)
                                        .foregroundColor(.white)
                                        .font(.custom("Formula1-Display-Regular", size: 20))
                                    Text(myDriver.lastName .uppercased())
                                        .font(.custom("Formula1-Display-Regular", size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                    HStack {
                                        AsyncImage(url: URL(string: myDriver.flag)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 33)
                                        
                                        Text(myDriver.carno)
                                            .font(.custom("Formula1-Display-Regular", size: 30))
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.top, 163) //TODO: fix this magic number
                                .padding(.bottom, 10)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .paleGray]), startPoint: .top, endPoint: .bottom)
                                )
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Text("Statistics")
                            Spacer()
                            Text("Biography")
                            Spacer()
                            Text("Results")
                            Spacer()
                        }
                        .font(.custom("Formula1-Display-Regular", size: 16))
                        .foregroundColor(.typeface)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(
                            .card)
                        
//                        Statistics(driver: driver)
//                            .id("Stats")
//                        Biography(driver: driver)
//                            .id("Bio")
//                        Results()
//                            .id("Res")
                    }
                }
            }
        }
        .task {
            myDriver = await scrapeDrivers(driverNo: driverNo)!
        }
    }
}
