//
//  ContentView.swift
//  TabView
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            MainView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("main")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("setting")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
