//
//  ContentView.swift
//  ScrollView
//
//  Created by 서보경 on 2020/10/02.
//

import SwiftUI

struct ContentView: View {
    @State var showingAdvancedOptions = false
    @State var toggling = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("header")) {
                    Toggle(isOn: $showingAdvancedOptions, label: {
                        Text("Toggle")
                    })
                }
                Section {
                    Button(action: {}, label: {
                        Text("Save changes")
                    }).disabled(!toggling)
                }

                if showingAdvancedOptions {
                    Toggle(isOn: $toggling) {
                        Text("Advanced")
                    }
                }

            }.navigationBarTitle(Text("Setting"))
        }
//        ScrollView {
//            Image(systemName: "heart.fill").padding()
//            Text("Hello, SwiftUI!").padding()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
