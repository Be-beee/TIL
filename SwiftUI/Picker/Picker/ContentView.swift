//
//  ContentView.swift
//  Picker
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct ContentView: View {
    var colors = ["Red", "Green", "Blue", "Black"]
    @State var selected = 0
    var body: some View {
        VStack {
            Picker(selection: $selected, label: Text("Choose the color")) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Text(colors[selected])
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
