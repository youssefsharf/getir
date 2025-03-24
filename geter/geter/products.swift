import SwiftUI
import Foundation

struct ProductView: View {
    
    @StateObject private var viewModel = CatViewModel()
    @StateObject private var viewModel1 = CateViewModel()
    
    @State private var selectedProduct: CatDatum? = nil
    @State private var showBottomSheet = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("product")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("purple1"))
                    .foregroundColor(.white)
                
                ZStack {
                    Rectangle()
                        .fill(Color("purple2"))
                        .frame(height: 60)
                    
                    if viewModel1.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel1.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else if let catData = viewModel1.catData, let data = catData.data {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(data, id: \.id) { category in
                                    Text(category.name.prefix(1).capitalized + category.name.dropFirst().lowercased())
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                        }
                    } else {
                        Text("No data available")
                    }
                }
                
                if let catData = viewModel1.catData, let data = catData.data, data.contains(where: { !$0.children.isEmpty }) {
                    ZStack {
                        Rectangle()
                            .fill(Color("purple2"))
                            .frame(height: 60)
                        
                        if viewModel1.isLoading {
                            ProgressView("Loading...")
                        } else if let errorMessage = viewModel1.errorMessage {
                            Text("Error: \(errorMessage)")
                                .foregroundColor(.red)
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(data, id: \.id) { category in
                                        if !category.children.isEmpty {
                                            VStack(alignment: .leading, spacing: 8) {
                                                ForEach(category.children, id: \.self) { child in
                                                    Text(child.prefix(1).capitalized + child.dropFirst().lowercased())
                                                        .font(.system(size: 16))
                                                        .foregroundColor(.white.opacity(0.8))
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else if let catData = viewModel.catData, let data = catData.data {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 32) {
                            ForEach(data, id: \.id) { product in
                                Button(action: {
                                    selectedProduct = product
                                    showBottomSheet = true
                                }) {
                                    VStack(spacing: 8) {
                                        ZStack(alignment: .topTrailing) {
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color("c"))
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 15)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                                
                                                // عرض الصورة
                                                if let imagesArray = product.imagesArray, !imagesArray.isEmpty {
                                                    if let imageName = imagesArray[0].image {
                                                        let baseURL = "https://api2.smartinb.ai:8001/"
                                                        if let encodedImageName = imageName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                                                            if let imageURL = URL(string: baseURL + encodedImageName) {
                                                                AsyncImage(url: imageURL) { phase in
                                                                    switch phase {
                                                                    case .empty:
                                                                        ProgressView()
                                                                            .frame(width: 100, height: 100)
                                                                    case .success(let image):
                                                                        image
                                                                            .resizable()
                                                                            .scaledToFit()
                                                                            .frame(width: 100, height: 100)
                                                                            .cornerRadius(15)
                                                                    case .failure:
                                                                        Image(systemName: "photo")
                                                                            .resizable()
                                                                            .scaledToFit()
                                                                            .frame(width: 100, height: 100)
                                                                            .cornerRadius(15)
                                                                            .foregroundColor(.gray)
                                                                    @unknown default:
                                                                        EmptyView()
                                                                    }
                                                                }
                                                            } else {
                                                                Text("Invalid URL")
                                                            }
                                                        } else {
                                                            Text("Invalid image name")
                                                        }
                                                    } else {
                                                        Text("No image available")
                                                    }
                                                } else {
                                                    Text("No images in array")
                                                }
                                            }
                                            
                                            Button(action: {
                                                print("تمت إضافة المنتج \(product.name ?? "No Name") إلى السلة")
                                            }) {
                                                Image(systemName: "plus.circle.fill")
                                                    .resizable()
                                                    .frame(width: 24, height: 24)
                                                    .foregroundColor(Color("purple1"))
                                                    .background(Color.white)
                                                    .cornerRadius(4)
                                                    .padding(4)
                                            }
                                            .offset(x: 8, y: -8)
                                        }
                                        
                                        HStack {
                                            Text("\(product.price ?? 0, specifier: "%.2f") ₺")
                                                .font(.subheadline)
                                                .bold()
                                                .foregroundColor(.secondary)
                                                .strikethrough()
                                            
                                            Text("\(product.ecommercePrice ?? 0, specifier: "%.2f") ₺")
                                                .font(.subheadline)
                                                .bold()
                                                .foregroundColor(Color("purple1"))
                                        }
                                        
                                        Text(product.name ?? "No Name")
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
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                } else {
                    Text("No data available")
                }
                
                Spacer()
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .onAppear {
                viewModel.fetchCatData()
                viewModel1.fetchCatData()
            }
            .sheet(isPresented: $showBottomSheet) {
                if let product = selectedProduct {
                    ProductDetailView(product: product)
                        .presentationDetents([.medium])
                        .padding(.top, 10)
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
