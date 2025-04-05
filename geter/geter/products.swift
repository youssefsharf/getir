// products.swift
import SwiftUI
import Foundation

struct ProductView: View {
    @StateObject private var viewModel = CatViewModel()
    @StateObject private var viewModel1 = CateViewModel()
    
    @State private var selectedProduct: CatDatum? = nil
    @State private var showBottomSheet = false
    @State private var selectedCategoryIndex: Int = 0
    @State private var selectedChildIndex: Int = 0
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("Product")
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
                    } else if let catData = viewModel1.catData {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(Array(catData.data.enumerated()), id: \.element.id) { index, category in
                                    VStack(spacing: 0) {
                                        Text(category.name.prefix(1).capitalized + category.name.dropFirst().lowercased())
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 15)
                                            .onTapGesture {
                                                selectedCategoryIndex = index
                                                selectedChildIndex = 0
                                                viewModel1.fetchChildren(for: category)
                                                loadProductsForSelectedCategory()
                                            }
                                        
                                        if selectedCategoryIndex == index {
                                            Rectangle()
                                                .fill(Color.yellow)
                                                .frame(height: 3)
                                                .padding(.horizontal, 15)
                                                .transition(.opacity)
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        Text("No data available")
                    }
                }
                .frame(height: 60)
                
                if !viewModel1.selectedChildren.isEmpty {
                    ZStack {
                        Rectangle()
                            .fill(Color("purple2"))
                            .frame(height: 60)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(Array(viewModel1.selectedChildren.enumerated()), id: \.element.id) { index, child in
                                    VStack(spacing: 0) {
                                        if let name = child.name {
                                            Text(name.prefix(1).capitalized + name.dropFirst().lowercased())
                                                .font(.system(size: 16))
                                                .foregroundColor(.white.opacity(0.8))
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 15)
                                                .onTapGesture {
                                                    selectedChildIndex = index
                                                    loadProductsForSelectedChildCategory()
                                                }
                                            
                                            if selectedChildIndex == index {
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(height: 3)
                                                    .padding(.horizontal, 15)
                                                    .transition(.opacity)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                }
                
                Rectangle()
                    .fill(Color("offwhite"))
                    .frame(height: 10)
                    .padding(.bottom, 10)
                
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
                                                
                                                if let imagesArray = product.imagesArray, !imagesArray.isEmpty,
                                                   let imageUrl = imagesArray[0].image,
                                                   let imageURL = URL(string: imageUrl) {
                                                    
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
                                                        case .failure(_):
                                                            placeholderImage()
                                                        @unknown default:
                                                            placeholderImage()
                                                        }
                                                    }
                                                } else {
                                                    placeholderImage()
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
    
    private func placeholderImage() -> some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray)
            .background(Color("c"))
            .cornerRadius(15)
    }
    
    private func loadProductsForSelectedCategory() {
        if let categoryId = viewModel1.catData?.data[selectedCategoryIndex].id {
            viewModel.fetchCatData(categoryId: categoryId)
        }
    }
    
    private func loadProductsForSelectedChildCategory() {
        guard selectedChildIndex < viewModel1.selectedChildren.count,
              let categoryId = viewModel1.selectedChildren[selectedChildIndex].id else {
            print("Invalid child category selection")
            return
        }
        viewModel.fetchCatData(categoryId: categoryId)
    }

}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
