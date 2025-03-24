import SwiftUI
import Foundation

struct ProductDetailView: View {
    let product: CatDatum
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) { // محاذاة الأيقونات إلى الزاوية اليمنى العليا
            // العناصر الرئيسية في منتصف الصفحة
            VStack(alignment: .center, spacing: 20) {
                // صورة المنتج مع دفعها إلى الأسفل
                if let imagesArray = product.imagesArray, let firstImage = imagesArray.first, let imageName = firstImage.image {
                    let baseURL = "https://api2.smartinb.ai:8001/"
                    let imageURL = URL(string: baseURL + imageName)
                    
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        case .failure:
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.top, 50) // دفع الصورة إلى الأسفل قليلاً
                } else {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                        .padding(.top, 50) // دفع الصورة إلى الأسفل قليلاً
                }
                
                // اسم المنتج
                Text(product.name ?? "No Name")
                    .font(.title)
                    .bold()
                
                // أسعار المنتج
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
                
                // السمات المخصصة للمنتج
                if let customAttributes = product.customAttributes, !customAttributes.isEmpty {
                    List(customAttributes, id: \.key) { attribute in
                        HStack {
                            Text(attribute.key ?? "Unknown Key")
                                .font(.headline)
                            Spacer()
                            Text(attribute.value ?? "No Value")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(height: 200)
                }
                
                Spacer() // لدفع العناصر إلى الأعلى
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // توسيع العناصر لتمتد على الصفحة
            .padding() // إضافة بعض الحواف
            
            // الأيقونات في الزاوية اليمنى العليا
            VStack(alignment: .trailing, spacing: 10) {
                Button(action: {
                    // إجراءات الزر (مثل إضافة إلى المفضلة)
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.top, 10)
                
                Button(action: {
                    // إجراءات الزر (مثل إضافة إلى السلة)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("purple1"))
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
        }
        .navigationTitle("Product Details")
    }
}
