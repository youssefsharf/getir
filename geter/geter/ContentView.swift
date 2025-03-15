import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2 // تحديد علامة التبويب الافتراضية
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // TabView هو العنصر الرئيسي
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    // علامة التبويب الأولى: البحث
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search") // نص اختياري
                        }
                        .tag(0)
                    
                    // علامة التبويب الثانية: الصفحة الرئيسية
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home") // نص اختياري
                        }
                        .tag(1)
                    
                    // علامة التبويب الثالثة: الملف الشخصي
                    ProfileView(selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile") // نص اختياري
                        }
                        .tag(2)
                }
                .id(selectedTab) // تثبيت حالة TabView
                .accentColor(Color("purple1"))
                
                // الخط المتحرك تحت الأيقونات
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 2) // ارتفاع الخط
                        
                        // الخط المتحرك
                        Rectangle()
                            .fill(Color("purple1"))
                            .frame(width: 50, height: 2) // عرض الخط 50 نقطة
                            .offset(x: calculateSliderOffset(geometry: geometry))
                            .animation(.easeInOut, value: selectedTab)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 2)
                }
                .frame(height: 20) // ارتفاع الشريط
            }
            
            // المستطيل الرمادي في الجزء السفلي
            // ارتفاع 100 نقطة
            // تأكد من أنه خلف العناصر الأخرى
        }
        .ignoresSafeArea() // تجاهل منطقة الأمان
    }
    
    // حساب موضع الخط المتحرك بناءً على علامة التبويب المحددة
    private func calculateSliderOffset(geometry: GeometryProxy) -> CGFloat {
        let tabWidth = geometry.size.width / 3
        return CGFloat(selectedTab) * tabWidth + (tabWidth / 2 - 25) // تعديل لمركزة الخط
    }
}
