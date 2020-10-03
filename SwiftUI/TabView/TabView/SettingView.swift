//
//  SettingView.swift
//  TabView
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct SettingView: View {
    @State var userAge = 1
    @State var showingSheet = false
    var body: some View {
        VStack {
            Text("Setting").padding()
            Stepper(value: $userAge, in: 1 ... 100) {
                Text("Your age")
            }.padding()
            Text("age: \(userAge)").padding()
            
            Button(action: {
                self.showingSheet = true
            }, label: {
                Text("Show ActionSheet")
            })
            .actionSheet(isPresented: $showingSheet, content: {
                ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [.default(Text("Dismiss")), .cancel()])
            })
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
