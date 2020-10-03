//
//  ContentView.swift
//  NavigationView
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            NavigationLink(
                destination: SubView(),
                label: {
                    Text("서브 뷰로 이동")
                }).navigationBarTitle("메인")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
