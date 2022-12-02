//
//  ContentView.swift
//  Sidebar iPad SwiftUI Test
//
//  Created by Michael Bonfanti on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            Text("Main")
            Text("Detail")
        }
    }
}
struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: DetailSplitView(number: 1)) {
                Label("Home", systemImage: "house.fill")
            }
            NavigationLink(destination: DetailSplitView(number: 2)) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink(destination: DetailNoSplitView(number: 3)) {
                Label("Info", systemImage: "info.circle.fill")
            }
        }
        .listStyle(SidebarListStyle())
    }
}
// Working as expected in a split view context
struct DetailSplitView: View {
    let number: Int
    var body: some View {
        VStack(spacing: 20) {
            Text("Main view for: \(number)")
            NavigationLink(destination: Text("Detail view for: \(number)")) {
                Text("Press here for detail")
            }
        }
    }
}
// Ideally want this to take up the whole screen (not just one side of a split view)
struct DetailNoSplitView: View {
    let number: Int
    var body: some View {
        Text("Detail view for \(number)")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
