//
//  RollingText.swift
//  RollingCounter
//
//  Created by Sergey Lukaschuk on 2022-12-07.
//

import SwiftUI

struct RollingText: View {
    var font: Font = .largeTitle
    var weight: Font.Weight = .regular

    @Binding var value: Int
    @State var animationRange: [Int] = []

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<animationRange.count, id: \.self) {_ in
                Text("8")
                    .font(font)
                    .fontWeight(weight)
                    .opacity(0)
                    .overlay {
                        GeometryReader { proxy in
                            let size = proxy.size

                            VStack(spacing: 0) {
                                ForEach(0...9, id: \.self) { number in
                                    Text("\(number)")
                                        .font(font)
                                        .fontWeight(weight)
                                        .frame(width: size.width, height: size.height, alignment: .center)
                                }
                            }
                        }
                        .clipped()
                    }
            }
        }
        .onAppear {
            animationRange = Array(repeating: 0, count: "\(value)".count)
        }
    }
}

struct RollingText_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
