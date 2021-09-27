//
//  ContentView.swift
//  Fructus
//
//  Created by Igor Efimov on 26.09.2021.
//

import SwiftUI

struct ContentView: View {
    var fruits = fruitsData

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
