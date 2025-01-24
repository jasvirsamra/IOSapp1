//
//  AddOrderView.swift
//  coffeerun
//
//  Created by Jasvir on 2025-01-24.
//

import SwiftUI

struct AddOrderView: View {
    @Binding var orders: [Order]
    @State private var name = ""
    @State private var coffeeType = "Coffee"
    @State private var size = "Medium"
    @State private var sugar = 0
    @State private var cream = 0

    let coffeeTypes = ["Coffee", "Latte", "Cappuccino", "Espresso"]
    let sizes = ["Small", "Medium", "Large"]

    var body: some View {
        Form {
            Section(header: Text("Customer Info")) {
                TextField("Name", text: $name)
            }

            Section(header: Text("Order Details")) {
                Picker("Coffee Type", selection: $coffeeType) {
                    ForEach(coffeeTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                Picker("Size", selection: $size) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                    }
                }
                Stepper("Sugar: \(sugar)", value: $sugar, in: 0...5)
                Stepper("Cream: \(cream)", value: $cream, in: 0...5)
            }

            Button("Save Order") {
                let newOrder = Order(name: name, coffeeType: coffeeType, size: size, sugar: sugar, cream: cream)
                orders.append(newOrder)
            }
        }
        .navigationTitle("Add New Order")
    }
}

