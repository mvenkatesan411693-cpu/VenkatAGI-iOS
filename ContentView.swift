import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var cartCount = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    HStack {
                        Text("Venkat ")
                            .font(.title.bold())
                        Text("AGI")
                            .font(.title.bold())
                            .foregroundStyle(.cyan)
                        Spacer()
                        Button {
                            showLogin = true
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("AI • TRADING • E-COMMERCE")
                            .font(.caption.bold())
                            .foregroundStyle(.cyan)
                        Text("One platform.\nVenkat AGI.")
                            .font(.system(size: 42, weight: .bold))
                        Text("AI assistant, Forex and crypto analysis, and online shopping in one modern platform.")
                            .foregroundStyle(.secondary)
                        HStack {
                            NavigationLink("Trading Analysis") {
                                TradingView()
                            }
                            .buttonStyle(.borderedProminent)
                            NavigationLink("Shop") {
                                ShopView(cartCount: $cartCount)
                            }
                            .buttonStyle(.bordered)
                        }
                    }

                    MarketCard()

                    Text("Features")
                        .font(.title2.bold())

                    FeatureCard(icon: "brain.head.profile", title: "AI Assistant", text: "AI-powered help for markets, products and platform guidance.")
                    FeatureCard(icon: "chart.xyaxis.line", title: "Trading Analysis", text: "Forex and crypto analysis with live-data integration ready.")
                    FeatureCard(icon: "cart.fill", title: "Online Store", text: "Products, cart, checkout and order management.")
                    FeatureCard(icon: "lock.shield.fill", title: "Secure Account", text: "Ready for Firebase Authentication and protected data.")
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .sheet(isPresented: $showLogin) {
                LoginView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Label("\(cartCount)", systemImage: "cart")
                }
            }
        }
    }
}

struct MarketCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🤖 AGI Market Dashboard")
                .font(.headline)
            MarketRow(name: "EUR/USD", price: "1.1732", change: "+0.42%")
            MarketRow(name: "BTC/USDT", price: "67,420", change: "+1.18%")
            MarketRow(name: "ETH/USDT", price: "2,540", change: "-0.31%")
            Text("Demo values — connect a market-data provider for live prices.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct MarketRow: View {
    let name: String
    let price: String
    let change: String
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(price).bold()
            Text(change).foregroundStyle(change.first == "-" ? .red : .green)
        }
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let text: String
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.cyan)
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(text).font(.subheadline).foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct TradingView: View {
    var body: some View {
        List {
            Section("Market Watch") {
                MarketRow(name: "EUR/USD", price: "1.1732", change: "+0.42%")
                MarketRow(name: "GBP/USD", price: "1.3421", change: "+0.27%")
                MarketRow(name: "BTC/USDT", price: "67,420", change: "+1.18%")
                MarketRow(name: "ETH/USDT", price: "2,540", change: "-0.31%")
            }
            Section("AI Insight") {
                Text("Trend: Positive")
                Text("Momentum: Moderate")
                Text("Risk: Medium")
            }
        }
        .navigationTitle("Trading Analysis")
    }
}

struct ShopView: View {
    @Binding var cartCount: Int
    var body: some View {
        List {
            ProductRow(name: "AGI Assistant Pro", price: "₹999", icon: "🤖", cartCount: $cartCount)
            ProductRow(name: "Trading Dashboard", price: "₹1,499", icon: "📊", cartCount: $cartCount)
            ProductRow(name: "Trading Guide", price: "₹299", icon: "📚", cartCount: $cartCount)
            ProductRow(name: "AI Pro Plan", price: "₹1,999", icon: "💻", cartCount: $cartCount)
        }
        .navigationTitle("Venkat AGI Store")
    }
}

struct ProductRow: View {
    let name: String
    let price: String
    let icon: String
    @Binding var cartCount: Int
    var body: some View {
        HStack {
            Text(icon).font(.largeTitle)
            VStack(alignment: .leading) {
                Text(name).bold()
                Text(price).foregroundStyle(.cyan)
            }
            Spacer()
            Button("Add") { cartCount += 1 }
                .buttonStyle(.borderedProminent)
        }
    }
}

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            Form {
                Section("Venkat AGI Login") {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)
                    Button("Continue") {
                        // Connect Firebase Authentication here.
                    }
                }
                Section {
                    Text("Firebase Authentication integration ready.")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Login")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}
