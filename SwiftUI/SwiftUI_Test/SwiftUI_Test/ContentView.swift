//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by 서보경 on 2020/09/29.
//

import SwiftUI

struct ContentView: View {
    @State var isHidden = true
    @State var isOn = false
    var body: some View {
        // return only one view
        VStack(spacing: 20) {
            // to use more views
            // Vertical Stack, HStack - Horizontal Stack
            Text("Hello, SwiftUI! long long long long long long long long long long long long long long long text")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.gray)
            
            Image(systemName: "heart.fill")
                .padding()
    //            .resizable()
    //            .aspectRatio(contentMode: .fill)
            
            Button(action: {
                // action
                isHidden.toggle()
            }, label: {
                // display
                Text("show bell")
            })
            if !isHidden {
                Image(systemName: "bell.fill")
                    .padding()
            }
            
            Toggle(isOn: $isOn, label: {
                Text("Welcome")
            }).padding()
            if isOn {
                Text("Hi!")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
