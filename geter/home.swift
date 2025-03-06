import SwiftUI

struct HomeView: View {
    @State private var categories: [Datum] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var searchText: String = "" // حالة نص البحث
    @State private var selectedTab: Int = 2
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // العنوان الرئيسي
            Text("getir")
                .bold()
                .font(.system(size: 30))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("my"))
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
                            NavigationLink(destination: ProductsView()) {
                                VStack(spacing: 8) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color("c"))
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(15)
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color("my"))
                                    }
                                    Text(category.name)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true) // يمنع النص من تغيير حجم المربع
                                        .frame(width: 100, height: 40) // تحديد حجم ثابت للنص
                                }
                                .frame(width: 100, height: 150) // تحديد حجم ثابت للمربع
                            }
                        }
                    }
                    .padding()
                }
            }
            
            Spacer() // هذا Spacer يدفع المحتوى للأعلى ويترك المساحة لشريط التنقل السفلي
            
            // Bottom Navigation Bar
            ZStack {
        
                
                Rectangle()
                    .fill(Color("m"))
                    .frame(height: 100)
                
                //.padding(.horizontal)
            }
            .frame(height: 10)// تحديد حجم شريط التنقل السفلي
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onAppear {
            loadCategories()
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
