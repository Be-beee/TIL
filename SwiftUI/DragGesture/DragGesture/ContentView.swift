//
//  ContentView.swift
//  DragGesture
//
//  Created by 서보경 on 2021/10/16.
//

import SwiftUI

struct ContentView: View {
    @State private var location: CGPoint = CGPoint(x: 0, y: 50)
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.pink)
            .frame(width: UIScreen.main.bounds.width, height: 100)
            .position(location)
            .gesture(
                simpleDrag
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
