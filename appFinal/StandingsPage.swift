//
//  StandingsPage.swift
//  appFinal
//
//  Created by Thea Yocum on 5/7/26.
//


import SwiftUI
import SwiftSoup
import SwiftData

struct StandingsPage: View {
    
    @State var standings: [standingsInfo] = [
        standingsInfo(standing: "", firstInitLastName: "", pts: "", tla: "", driverNo: "")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        
                        Text("DRIVERS' STANDINGS")
                            .foregroundStyle(.typeface)
                            .font(.custom("Formula1-Display-Regular", size: 26))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 25){
                            
                            GridRow {
                                Text("POS")
                                    .gridCellColumns(2)
                                Text("DRIVER")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("PTS")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .font(.custom("ProximaNova-Bold", size: 20))
                            
                            
                            //TODO: remove the magic numbers on the for each to prevent "index out of range" crashes
                            ForEach (standings, id: \.self) { driver in
                                let standing = driver.standing
                                let pts = driver.pts
                                let person = driver.firstInitLastName
                                let driverNo = driver.driverNo
                                
                                NavigationLink {
                                    //This is what the Navigation link displays (the driver page)
                                    ZStack {
                                        Color(.backdrop)
                                            .edgesIgnoringSafeArea(.all)
                                        ScrollView {
                                            DriverView(driverNo: driverNo)
                                        }
                                    }
                                    
                                } label: {
                                    //This is what the navigation link looks like on the standing's page
                                    GridRow {
                                        Text(standing)
                                            .frame(minWidth: 30, alignment: .leading)
                                            .padding(.leading, 5)
                                        
//                                        AsyncImage(url: URL(string: img)) { image in
//                                            image
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                        } placeholder: {
//                                            ProgressView()
//                                        }
//                                        .frame(width: 40, height: 40)
//                                        .clipShape(Circle())
//                                        .padding(.trailing, 15)

                                        Text(person)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(pts)
                                            .frame(alignment: .trailing)
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(Color(.gray))
                                    }
                                    .font(.custom("Formula1-Display-Regular", size: 14))
                                    .foregroundStyle(.typeface)
                                }
                            }
                        }
                    }
//                    .foregroundStyle(.typeface)
                    .font(.custom("ProximaNova-Medium", size: 15))
                    .frame(maxWidth: .infinity)
                }
                .padding(20)
            }
        }
        .task {
            standings = await scrapeStandings(url: "https://www.f1academy.com/Racing-Series/Standings/Driver?seasonId=4", seasonTotalDrivers: 18)!
        }
    }
}

#Preview {
    StandingsPage()
}
