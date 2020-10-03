//
//  SubView.swift
//  NavigationView
//
//  Created by 서보경 on 2020/10/03.
//

import SwiftUI

struct SubView: View {
    var body: some View {
        VStack {
            Text("서브뷰입니다.")
        }.navigationBarTitle("서브 뷰")
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
