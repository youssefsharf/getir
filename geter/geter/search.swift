import SwiftUI

struct SearchView: View {
    @State private var searchText: String = "" // حالة نص البحث
    @State private var selectedTab: Int = 1
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // العنوان الرئيسي
                Text("Search")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("my"))
                    .foregroundColor(.white)
                
                // شريط البحث
                ZStack {
                    Rectangle()
                        .fill(Color.white) // لون خلفية شريط البحث
                        .frame(height: 50)
                    
                    HStack {
                        // أيقونة البحث (لا تفعل شيئًا سوى البقاء في الصفحة)
                        Button(action: {
                            // لا يوجد إجراء هنا
                        }) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("my"))
                        }
                        
                        // حقل النص
                        TextField("Search...", text: $searchText)
                            .padding(10)
                            .background(Color(.white))
                            .cornerRadius(8)
                        
                        // Spacer لدفع أيقونة "X" إلى أقصى اليمين
                        Spacer()
                        
                        // أيقونة "X" لحذف المحتويات
                        Button(action: {
                            searchText = "" // حذف النص
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal) // إضافة بعض الـ Padding الأفقي
                }
                
                Rectangle()
                    .fill(Color("m"))
                    .frame(height: 15)
                
                // Spacer لدفع المحتوى العلوي إلى الأعلى
                Spacer()
                
                // الأيقونات أسفل الشاشة
     
                
                
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
