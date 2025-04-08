import SwiftUI

struct HomeView: View {
    @State private var categories: [Datum] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var searchText: String = ""
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("getir")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("purple1"))
                    .foregroundColor(.yellow)
                
                if isLoading {
                    ProgressView()
                        .padding()
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(categories, id: \._id) { category in
                                NavigationLink(destination: ProductView()) {
                                    VStack(spacing: 8) {
                                        ZStack {
                                            Rectangle()
                                                .fill(Color("c"))
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(15)
                                            if let imageURL = URL(string: category.image ?? "") {
                                                AsyncImage(url: imageURL) { phase in
                                                    switch phase {
                                                    case .empty:
                                                        ProgressView()
                                                    case .success(let image):
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 100, height: 100)
                                                            .cornerRadius(15)
                                                    case .failure:
                                                        Image(systemName: "xmark.circle")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                            .foregroundColor(.red)
                                                    @unknown default:
                                                        EmptyView()
                                                    }
                                                }
                                            } else {
                                                Image(systemName: "xmark.circle")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.red)
                                            }
                                        }
                                        Text(category.name)
                                            .font(.caption)
                                            .bold()
                                            .foregroundColor(.primary)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: 100, height: 40)
                                    }
                                    .frame(width: 100, height: 150)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
            .accentColor(.white) // هذا يجعل زر الرجوع أبيض
            .ignoresSafeArea(.container, edges: .bottom)
            .onAppear {
                loadCategories()
            }
        }
    }
    
    private func loadCategories() {
        isLoading = true
        NetworkService.shared.fetchCategories { result in
            isLoading = false
            switch result {
            case .success(let category):
                self.categories = category.data
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
