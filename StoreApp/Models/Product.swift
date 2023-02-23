//
//  Product.swift
//  StoreApp
//
//  Created by Minjae Lee on 2023/02/23.
//

import Foundation

struct Product: Codable {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}
