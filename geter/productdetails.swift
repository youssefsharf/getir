import SwiftUI

struct ProductDetailView: View {
    let product: CatDatum
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("token") var token: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    // Product Image
                    ZStack(alignment: .topTrailing) {
                        ZStack {
                            Rectangle()
                                .fill(Color("c"))
                                .frame(width: 200, height: 200)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            if let imagesArray = product.imagesArray, !imagesArray.isEmpty,
                               let imageUrl = imagesArray[0].image {
                                let cleanedImageUrl = imageUrl.replacingOccurrences(of: "https://api2.smartinb.ai:8001/", with: "")
                                let fullImageUrl = "https://api2.smartinb.ai:8001/" + cleanedImageUrl
                                
                                if let imageURL = URL(string: fullImageUrl) {
                                    AsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 200, height: 200)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 200)
                                                .cornerRadius(15)
                                        case .failure(_):
                                            placeholderImage()
                                                .frame(width: 200, height: 200)
                                        @unknown default:
                                            placeholderImage()
                                                .frame(width: 200, height: 200)
                                        }
                                    }
                                } else {
                                    placeholderImage()
                                        .frame(width: 200, height: 200)
                                }
                            } else {
                                placeholderImage()
                                    .frame(width: 200, height: 200)
                            }
                        }
                        
                        // Add to cart button
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
                    .padding(.top, 50)
                    
                    // Product Info
                    VStack(spacing: 10) {
                        Text(product.name ?? "No Name")
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        
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
                    }
                    
                    // Product Attributes
                    if let customAttributes = product.customAttributes, !customAttributes.isEmpty {
                        VStack(alignment: .leading) {
                            Text("المواصفات")
                                .font(.headline)
                                .padding(.bottom, 5)
                            
                            ForEach(customAttributes, id: \.key) { attribute in
                                HStack {
                                    Text(attribute.key ?? "Unknown Key")
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Text(attribute.value ?? "No Value")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 3)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            // Close and Favorite buttons
            VStack(alignment: .trailing, spacing: 15) {
                // Close button
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("purple1"))
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                
                // Favorite button
                Button {
                    addToWishlist()
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("purple1"))
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .disabled(isLoading)
            }
            .padding(.top, 15)
            .padding(.trailing, 15)
            
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
            }
        }
        .navigationTitle("تفاصيل المنتج")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("تنبيه"),
                message: Text(alertMessage),
                dismissButton: .default(Text("حسنًا"))
               ) }
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
    
    private func addToWishlist() {
        guard !token.isEmpty else {
            alertMessage = "الرجاء تسجيل الدخول أولاً"
            showAlert = true
            print("❌ Error: Token is empty")
            return
        }
        
        guard let productId = product.id, !productId.isEmpty else {
            alertMessage = "خطأ في معرّف المنتج: المنتج لا يحتوي على ID"
            showAlert = true
            print("❌ Error: Product ID is nil or empty")
            print("Product Object:", product)
            return
        }

        print("=== Starting Add to Wishlist ===")
        print("🔹 Product ID:", productId)
        print("🔹 Token:", token)

        isLoading = true
        
        let urlString = "https://api2.smartinb.ai:8001/api/wishlist?databaseName=B202"
        guard let url = URL(string: urlString) else {
            alertMessage = "عنوان خاطئ للخادم"
            showAlert = true
            isLoading = false
            print("❌ Error: Invalid URL - \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["productId": productId]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            print("🔹 Request Body:", body)
        } catch {
            isLoading = false
            alertMessage = "خطأ في تحضير البيانات"
            showAlert = true
            print("❌ Error encoding body:", error.localizedDescription)
            return
        }

        // Print request details
        print("🔹 Request URL:", request.url?.absoluteString ?? "N/A")
        print("🔹 Request Headers:", request.allHTTPHeaderFields ?? [:])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                // Print response details
                print("\n=== Response Received ===")
                print("🔹 Timestamp:", Date())
                
                if let error = error {
                    alertMessage = "خطأ في الاتصال: \(error.localizedDescription)"
                    showAlert = true
                    print("❌ Network Error:", error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    alertMessage = "استجابة غير صحيحة من الخادم"
                    showAlert = true
                    print("❌ Invalid Response: Not HTTPURLResponse")
                    return
                }
                
                print("🔹 Status Code:", httpResponse.statusCode)
                print("🔹 Response Headers:", httpResponse.allHeaderFields)
                
                if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("🔹 Response Body:", responseString)
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("🔹 JSON Response:", json)
                    } catch {
                        print("⚠️ Couldn't parse JSON:", error.localizedDescription)
                    }
                }
                
                if httpResponse.statusCode == 200 {
                    alertMessage = "تمت إضافة المنتج إلى المفضلة بنجاح"
                    print("✅ Success: Product added to wishlist")
                } else {
                    alertMessage = "فشل الإضافة. الرمز: \(httpResponse.statusCode)"
                    print("❌ Server Error: Status code", httpResponse.statusCode)
                }
                
                showAlert = true
            }
        }.resume()
    }
}
