import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(0)
                    
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(1)
                    
                    ProfileView(selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .tag(2)
                }
                .id(selectedTab)
                .accentColor(Color("purple1"))
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 2)
                        
                        Rectangle()
                            .fill(Color("purple1"))
                            .frame(width: 50, height: 2)
                            .offset(x: calculateSliderOffset(geometry: geometry))
                            .animation(.easeInOut, value: selectedTab)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 2)
                }
                .frame(height: 20)
            }
        }
        .ignoresSafeArea()
    }
    
    private func calculateSliderOffset(geometry: GeometryProxy) -> CGFloat {
        let tabWidth = geometry.size.width / 3
        return CGFloat(selectedTab) * tabWidth + (tabWidth / 2 - 25)
    }
}
