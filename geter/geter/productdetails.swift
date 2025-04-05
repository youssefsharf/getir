import SwiftUI

struct ProductDetailView: View {
    let product: CatDatum
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("token") var token: String = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    @State private var isFavorite = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    // Product Image - Updated to match ProductView's style
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
                                // Remove the base URL prefix if it exists
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
                        
                        // Plus button similar to ProductView
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
                    
                    // Rest of your existing code...
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
                    
                    // Favorite Button
                    Button(action: {
                        addToWishlistWithRetry()
                    }) {
                        HStack {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.white)
                            
                            Text(isFavorite ? "تمت الإضافة إلى المفضلة" : "إضافة إلى المفضلة")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("purple1"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    .disabled(!isValidToken() || isLoading || isFavorite)
                    .overlay(
                        isLoading ? ProgressView().tint(.white) : nil
                    )
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            // Close Button
            VStack(alignment: .trailing, spacing: 15) {
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
            }
            .padding(.top, 15)
            .padding(.trailing, 15)
        }
        .navigationTitle("تفاصيل المنتج")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("حسناً")))
        }
        .onAppear {
            checkIfFavorite()
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
    
    
    // MARK: - Wishlist Functions
    
    private func checkIfFavorite() {
        guard isValidToken(), let productId = product.id else { return }
        
        let url = URL(string: "https://api2.smartinb.ai:8001/api/wishlist?databaseName=B202")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        isLoading = true
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Error checking wishlist: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200,
                      let data = data else {
                    print("Invalid response when checking wishlist")
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let products = json["data"] as? [[String: Any]] {
                        self.isFavorite = products.contains { item in
                            (item["_id"] as? String) == productId ||
                            (item["productId"] as? String) == productId
                        }
                    }
                } catch {
                    print("Failed to parse wishlist response: \(error)")
                }
            }
        }.resume()
    }
    
    private func addToWishlistWithRetry(retryCount: Int = 0) {
        guard retryCount < 3 else {
            showAlert(message: "فشلت المحاولة بعد عدة مرات، يرجى المحاولة لاحقاً")
            return
        }
        
        isLoading = true
        addToWishlist { success in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if success {
                    self.isFavorite = true
                    self.showAlert(message: "تمت إضافة المنتج إلى المفضلة بنجاح")
                } else if retryCount < 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.addToWishlistWithRetry(retryCount: retryCount + 1)
                    }
                } else {
                    self.showAlert(message: "فشل إضافة المنتج إلى المفضلة")
                }
            }
        }
    }
    
    private func addToWishlist(completion: @escaping (Bool) -> Void) {
        guard isValidToken() else {
            showAlert(message: "يجب تسجيل الدخول أولاً")
            completion(false)
            return
        }
        
        guard let productId = product.id else {
            showAlert(message: "معرّف المنتج غير متوفر")
            completion(false)
            return
        }
        
        let url = URL(string: "https://api2.smartinb.ai:8001/api/wishlist?databaseName=B202")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = [
            "productId": productId,
            "databaseName": "B202"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            
            isLoading = true
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if let error = error {
                        self.showAlert(message: "خطأ في الاتصال: \(error.localizedDescription)")
                        completion(false)
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        self.showAlert(message: "استجابة غير صالحة من الخادم")
                        completion(false)
                        return
                    }
                    
                    switch httpResponse.statusCode {
                    case 200..<300:
                        completion(true)
                    case 401:
                        self.token = ""
                        self.showAlert(message: "انتهت الجلسة، يرجى تسجيل الدخول مرة أخرى")
                        completion(false)
                    case 500:
                        if let data = data,
                           let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                           let serverMessage = json["message"] as? String {
                            self.showAlert(message: "خطأ في الخادم: \(serverMessage)")
                        } else {
                            self.showAlert(message: "خطأ في الخادم، يرجى المحاولة لاحقاً")
                        }
                        completion(false)
                    default:
                        self.showAlert(message: "حدث خطأ غير متوقع (كود: \(httpResponse.statusCode))")
                        completion(false)
                    }
                }
            }.resume()
        } catch {
            showAlert(message: "خطأ في تحضير الطلب: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    private func parseServerError(data: Data?) -> String {
        guard let data = data else {
            return "خطأ غير معروف من الخادم"
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let message = json["message"] as? String {
                return message
            }
        } catch {
            print("Error parsing response: \(error)")
        }
        
        return "حدث خطأ غير متوقع"
    }
    
    // MARK: - Helper Functions
    
    private func isValidToken() -> Bool {
        return !token.isEmpty && token.count > 30
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}
