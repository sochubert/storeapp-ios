//
//  Locale+Extensions.swift
//  StoreApp
//
//  Created by Minjae Lee on 2023/02/25.
//

import Foundation

extension Locale {
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
