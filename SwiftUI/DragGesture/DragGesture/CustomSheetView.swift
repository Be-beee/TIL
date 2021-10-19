//
//  CustomSheetView.swift
//  DragGesture
//
//  Created by 서보경 on 2021/10/16.
//

import SwiftUI

struct CustomSheetView: View {
    @State var isOpened: Bool = false
    
    @GestureState var transitionValue: CGFloat = 100
    
    var simpleGesture: some Gesture {
        DragGesture()
            .updating($transitionValue) { value, state, _ in
                state = 400
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Hello, world")
                    .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(Color.blue)
            .cornerRadius(20)
            .offset(x: 0, y: geometry.size.height - transitionValue)
            .animation(.interactiveSpring())
            .gesture(simpleGesture)
        }
    }
}

struct CustomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetView()
    }
}
