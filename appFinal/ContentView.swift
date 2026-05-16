//
//  ContentView.swift
//  appFinal
//
//  Created by Thea Yocum on 5/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NewsPage()
                .tabItem {
                    Label("News", systemImage: "house.fill")
                }
//            SchedulePage()
//                .tabItem {
//                    Label("Schedule", systemImage: "calendar")
//                }
            StandingsPage()
                .tabItem {
                    Label("Standings", systemImage: "flag.pattern.checkered.2.crossed")
                }
//            WatchPage()
//                .tabItem{
//                    Label("Watch", systemImage: "play")
//                }
//            SettingsPage()
//                .tabItem {
//                    Label("Settings", systemImage: "gearshape.fill")
//                }
        }
    }
}

#Preview {
    ContentView()
}
