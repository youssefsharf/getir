import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: Int = 1
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("Search")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("purple1"))
                    .foregroundColor(.white)
                
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 50)
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("purple1"))
                        }
                        
                        TextField("Search...", text: $searchText)
                            .padding(10)
                            .background(Color(.white))
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Rectangle()
                    .fill(Color("m"))
                    .frame(height: 15)
                
                Spacer()
              
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
