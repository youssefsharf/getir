//
//  ProductsView.swift
//  geter
//
//  Created by MacBook Air on 3/2/25.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // العنوان الرئيسي
                Text("Products")
                    .bold()
                    .font(.system(size: 20)) // زيادة حجم الخط هنا
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("my")) // تأكد من تعريف هذا اللون في الأصول
                    .foregroundColor(.white)
                
                // شريط التصنيفات
                ZStack {
                    Rectangle()
                        .fill(Color("v")) // تأكد من تعريف هذا اللون في الأصول
                        .frame(height: 60)
                    
                    HStack(spacing: 9) { // زيادة التباعد بين العناصر هنا
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Beverages")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Snacks")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Fruits & Veggies")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Milk & Dairy")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        
                        
                        Spacer()
                    }
                    
                    //.padding(.horizontal, 10) // إضافة تباعد أفقي لتجنب الالتصاف بالحواف
                }
                ZStack {
                    Rectangle()
                        .fill(Color.white) // تأكد من تعريف هذا اللون في الأصول
                        .frame(height: 60)
                    
                    HStack(spacing: 9) { // زيادة التباعد بين العناصر هنا
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Beverages")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(Color("my"))
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Snacks")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(Color("my"))
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Fruits & Veggies")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(Color("my"))
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Milk & Dairy")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(Color("my"))
                        }
                        
                        
                        Spacer()
                    }
                    
                    //.padding(.horizontal, 10) // إضافة تباعد أفقي لتجنب الالتصاف بالحواف
                }
                Spacer() // لدفع المحتوى للأعلى
            }
            //.navigationTitle("Products") // إضافة عنوان للشاشة
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
