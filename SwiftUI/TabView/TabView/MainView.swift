//
//  MainView.swift
//  TabView
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct MainView: View {
    @State private var showingAlert = false
    @State var showingText = false
    var body: some View {
        VStack {
            Text("Hello, Main!")
            Button(action: {
                showingAlert = true
            }, label: {
                Text("Show Alert")
            })
            .alert(isPresented: $showingAlert, content: {
//                Alert(title: Text("title"), message: Text("this is message"), dismissButton: .default(Text("OK")))
                Alert(title: Text("Title"), message: Text("Message"), primaryButton: .destructive(Text("Primary"), action: {
                    self.showingText = true
                }), secondaryButton: .cancel())
            })
            
            if showingText {
                Text("Alert Primary Button Selected")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
