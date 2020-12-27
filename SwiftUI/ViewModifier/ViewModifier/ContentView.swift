//
//  ContentView.swift
//  ViewModifier
//
//  Created by 서보경 on 2020/12/27.
//

import SwiftUI

struct MyTextStyle: ViewModifier {
    var myWeight = Font.Weight.regular
    var myFont = Font.title3
    var myColor = Color.green
        
    func body(content: Content) -> some View {
        content
                .font(myFont.weight(myWeight))
                .foregroundColor(myColor)
                .padding(.bottom, 20)
    }

} // ViewModifier를 활용한 특성 정의

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .modifier(MyTextStyle(myWeight: .bold))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
