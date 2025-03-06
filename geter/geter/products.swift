//
//  ProductsView.swift
//  geter
//
//  Created by MacBook Air on 3/2/25.
//

import SwiftUI

struct ProductsView: View {
    @State private var searchText: String = "" // حالة نص البحث
    @State private var selectedTab: Int = 1
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
                   
                  // إضافة تباعد أفق Spacer()ي لتجنب الالتصاف بالحواف
                }
                ZStack {
                    Rectangle()
                        .fill(Color.white) // تأكد من تعريف هذا اللون في الأصول
                        .frame(height: 60)
                    
                    HStack(spacing: 9) { // زيادة التباعد بين العناصر هنا
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Text("May Interest You")
                                .bold()
                                
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("BRO")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Fruits & Veggies")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Milk & Dairy")
                                .bold()
                                .font(.system(size: 15))
                                .foregroundColor(.purple)
                        }
                        
                        
                        Spacer()
                    }
                   
                  // إضافة تباعد أفق Spacer()ي لتجنب الالتصاف بالحواف
                }
                Rectangle()
                    .fill(Color("m"))
                    .frame(height: 20)
                Spacer()
                
                               
                           }
                           .ignoresSafeArea(.container, edges: .bottom)
                       }
                   }
                   
                   // حساب موضع السلايدر بناءً على الأيقونة المحددة
    // حساب موضع السلايدر بناءً على الأيقونة المحددة
      private func calculateOffset(geometry: GeometryProxy) -> CGFloat {
          let tabWidth = geometry.size.width / 3
          return CGFloat(selectedTab - 1) * tabWidth + (tabWidth / 2 - 15)
      }
  }
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
