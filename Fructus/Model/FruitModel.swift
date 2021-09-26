//
//  FruitModel.swift
//  Fructus
//
//  Created by Igor Efimov on 26.09.2021.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColor: [Color]
    var description: String
    var nutrition: [String]
}
