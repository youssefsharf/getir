import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2 // تحديد علامة التبويب الافتراضية
    
    var body: some View {
        ZStack() {
            // الخلفية الملونة (Rectangle)
            Rectangle()
                .fill(Color.gray.opacity(0.2)) // لون الخلفية
                .frame(height: 100) // ارتفاع الخلفية
                .ignoresSafeArea(edges: .bottom) // تجاهل الحواف الآمنة للشاشة
            
            // علامات التبويب والشريط المتحرك داخل الـ Rectangle
            VStack(spacing: 0) {
                // TabView
                TabView(selection: $selectedTab) {
                    // علامة التبويب الأولى: البحث
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
// نص اختياري
                        }
                        .tag(0)
                    
                    // علامة التبويب الثانية: الصفحة الرئيسية
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                           // نص اختياري
                        }
                        .tag(1)
                    
                    // علامة التبويب الثالثة: الملف الشخصي
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                           // نص اختياري
                        }
                        .tag(2)
                }
                .accentColor(.purple)
                
                // الخط المتحرك تحت الأيقونات
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 2) // ارتفاع الخط
                        
                        // الخط المتحرك
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 50, height: 2) // عرض الخط 50 نقطة
                            .offset(x: calculateSliderOffset(geometry: geometry))
                            .animation(.easeInOut, value: selectedTab)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 2)
                }
                .frame(height: 2) // ارتفاع الشريط
            }
       // خلفية VStack لتتناسب مع الـ Rectangle
        }
    }
    
    // حساب موضع الخط المتحرك بناءً على علامة التبويب المحددة
    private func calculateSliderOffset(geometry: GeometryProxy) -> CGFloat {
        let tabWidth = geometry.size.width / 3
        return CGFloat(selectedTab) * tabWidth + (tabWidth / 2 - 25) // تعديل لمركزة الخط
    }
}
