//
//  ContentView.swift
//  RollingCounter
//
//  Created by Sergey Lukaschuk on 2022-12-07.
//

import SwiftUI

struct ContentView: View {
    @State var value: Int = 111

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                RollingText(font: .system(size: 55), weight: .black, value: $value)

                Button("Change Value") {
                    value = .random(in: 200...300)
                }
            }
            .padding()
            .navigationTitle("Rolling text")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
