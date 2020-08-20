//
//  ContentView.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/03.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
       var body: some View {
           TabView(selection: $selection){
               HomeView()
                   .tabItem {
                    VStack {
                           Image(systemName: "house.fill")
//                           Text("Home")
                       }
                   }
                   .tag(0)
               DetailView() // TODO: change rewords view
                   .tabItem {
                       VStack {
                           Image(systemName: "star")
//                           Text("Rewards")
                       }
                   }
                   .tag(1)
               HostView()
                   .tabItem {
                       VStack {
                           Image(systemName: "plus.circle")
//                           Text("Host")
                       }
                   }
                   .tag(2)
               ChatView()
                   .tabItem {
                       VStack {
                           Image(systemName: "message")
//                           Text("Chats")
                       }
                   }
                   .tag(3)
               ProfileView()
//                LoginView()
                   .tabItem {
                       VStack {
                           Image(systemName: "person")
//                           Text("Profile")
                       }
                   }
                   .tag(4)
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        Group {
//            ContentView()
//                .previewDevice("iPhone 8")
//                .environment(\.colorScheme, .light)
//
//            ContentView()
//                .previewDevice("iPhone 11 pro")
//                .environment(\.colorScheme, .light)
//
//            ContentView()
//                .previewDevice("iPhone 11")
//                .environment(\.colorScheme, .dark)
//
//
//            ContentView()
//                .previewDevice("iPhone 11 Pro Max")
//                .environment(\.colorScheme, .dark)
//        }
    }
}
