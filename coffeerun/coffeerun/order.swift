//
//  order.swift
//  coffeerun
//
//  Created by Jasvir on 2025-01-24.
//


import Foundation

struct Order: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var coffeeType: String
    var size: String
    var sugar: Int
    var cream: Int

    // Conformance to Equatable: Automatically synthesized by Swift
}
