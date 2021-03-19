//
//  ContentView.swift
//  Part1_5NumbersSum
//
//  Created by hiraoka on 2021/03/17.
//

import SwiftUI

struct ContentView: View {
    @State private var values: [String] = ["", "", "", "", ""]    
    @State private var sum: Int?

    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 16) {
                
                ForEach(0 ..< values.count) { index in
                    TextField("", text: $values[index])
                }
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                
                Button("Button") {
                    sum = values
                        .map { Int($0) ?? 0 }
                        .reduce(0, +)
                }
                
                Text(sum.map { String($0) } ?? "Label")
                    .frame(width: 100, alignment: .leading)
            }
            .padding()
            .frame(width: geometry.frame(in: .global).width,
                   height: geometry.frame(in: .global).height,
                   alignment: .topLeading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
