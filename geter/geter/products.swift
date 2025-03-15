import SwiftUI

struct ProductsView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: Int = 1
    @StateObject private var viewModel = CategoryViewModel2()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // العنوان الرئيسي
                Text("Products")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("purple1"))
                    .foregroundColor(.white)
                
                // شريط التصنيفات
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 60)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 9) {
                            ForEach(viewModel.categories, id: \.id) { category in
                                Button(action: {
                                    // Handle category selection
                                }) {
                                    Text(category.name)
                                        .bold()
                                        .font(.system(size: 15))
                                        .foregroundColor(.red)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color("offwhite"))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // قسم "May Interest You" والأقسام الأخرى
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 60)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 9) {
                            NavigationLink(destination: LoginView()) {
                                Text("May Interest You")
                                    .bold()
                                    .font(.system(size: 15))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color("offwhite"))
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: LoginView()) {
                                Text("BRO")
                                    .bold()
                                    .font(.system(size: 15))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color("offwhite"))
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: LoginView()) {
                                Text("Fruits & Veggies")
                                    .bold()
                                    .font(.system(size: 15))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color("offwhite"))
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: LoginView()) {
                                Text("Milk & Dairy")
                                    .bold()
                                    .font(.system(size: 15))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color("offwhite"))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // الفاصل
                Rectangle()
                    .fill(Color("offwhite"))
                    .frame(height: 20)
                
                // قائمة المنتجات أو الفئات
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.categories, id: \.id) { category in
                        VStack(alignment: .leading) {
                            Text(category.name)
                                .font(.headline)
                            Text(category.shortDescription)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
            }
            .onAppear {
                viewModel.fetchCategories()
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
