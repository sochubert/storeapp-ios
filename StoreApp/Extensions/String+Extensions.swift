//
//  String+Extensions.swift
//  StoreApp
//
//  Created by Minjae Lee on 2023/03/04.
//

import Foundation

extension String {
    
    var isNumeric: Bool {
        Double(self) != nil
    }
}
