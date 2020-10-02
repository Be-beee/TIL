//
//  ContentView.swift
//  List
//
//  Created by 서보경 on 2020/10/02.
//

import SwiftUI

struct SampleRow: View {
    var title: String
    var body: some View {
        Text("Things: \(title)")
    }
}

struct Family {
    var id = UUID()
    var name: String
}

struct FailyRow: View {
    var family: Family
    var body: some View {
        Text("Family: \(family.name)")
    }
}


struct ContentView: View {
    @State var name = "Be-beee"
    @State var password = ""
    @State var users = ["Be-beee", "HI", "kk"]
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(users, id: \.self) { user in
//                    Text(user)
//                }
//                .onMove(perform: move)
//            }
//            .navigationBarItems(trailing: EditButton())
//        }
        List {
            Section(header: Text("Important")) {
                SampleRow(title: "Task")
                SampleRow(title: "Task")
                SampleRow(title: "Task")
            }
            Section(header: Text("Other")) {
                SampleRow(title: "Task")
                SampleRow(title: "Task")
                SampleRow(title: "Task")
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    func move(from source: IndexSet, to destination: Int) {
        let reversedSource = source.sorted()
        for index in reversedSource.reversed() {
            users.insert(users.remove(at: index), at: destination)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
