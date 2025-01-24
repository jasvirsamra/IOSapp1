//
//   Persistence.swift
//  coffeerun
//
//  Created by Jasvir on 2025-01-24.
//

import Foundation

class OrderPersistence {
    static let shared = OrderPersistence()
    private let ordersKey = "savedOrders"

    func saveOrders(_ orders: [Order]) {
        if let data = try? JSONEncoder().encode(orders) {
            UserDefaults.standard.set(data, forKey: ordersKey)
        }
    }

    func loadOrders() -> [Order] {
        if let data = UserDefaults.standard.data(forKey: ordersKey),
           let savedOrders = try? JSONDecoder().decode([Order].self, from: data) {
            return savedOrders
        }
        return []
    }
}

