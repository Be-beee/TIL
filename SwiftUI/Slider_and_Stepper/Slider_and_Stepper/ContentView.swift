//
//  ContentView.swift
//  Slider_and_Stepper
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct ContentView: View {
    @State var grade: Double = 0
    @State var age = 1
    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 1 ... 100).padding()
            Text("Your age is \(age)")
            Slider(value: $grade, in: 0 ... 100, step: 1).padding()
            Text("Your grade is \(grade)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
