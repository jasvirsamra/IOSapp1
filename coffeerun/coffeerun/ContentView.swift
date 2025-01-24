import SwiftUI

struct ContentView: View {
    @State private var orders: [Order] = OrderPersistence.shared.loadOrders()

    var body: some View {
        NavigationView {
            VStack {
                List(orders) { order in
                    HStack {
                        Text(order.name)
                            .font(.headline)
                        Spacer()
                        Text("\(order.size) \(order.coffeeType)")
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Tim Hortons Orders")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add Order") {
                            AddOrderView(orders: $orders)
                        }
                    }
                }
            }
        }
        // Save orders whenever they change
        .onChange(of: orders) { _, newOrders in
            OrderPersistence.shared.saveOrders(newOrders)
        }
    }
}

          
