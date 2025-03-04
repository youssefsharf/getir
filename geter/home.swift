import SwiftUI

struct HomeView: View {
    @State private var searchText: String = "" // حالة نص البحث

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // العنوان الرئيسي
                Text("getir")
                    .bold()
                                      .font(.system(size: 30)) // زيادة حجم الخط هنا
                                      .frame(maxWidth: .infinity)
                                      .padding()
                                      .background(Color("my"))
                                      .foregroundColor(.yellow)
                
                ZStack {
                    Rectangle()
                        .fill(Color.white) // لون خلفية شريط البحث
                        .frame(height: 50)
                    
                    HStack {
                        // أيقونة البحث
                        Button(action: {
                            // إجراء البحث هنا
                        }) {
                            Image(systemName: "location") // أيقونة الموقع
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("my"))
                        }
                        // حقل النص
                        Text("No Adress Information")
                            .bold()
                                              .font(.system(size: 15)) // زيادة حجم الخط هنا
                                              
                                             
                                              .foregroundColor(.black)
                            // أيقونة "X" لحذف المحتويات
                        // Spacer لدفع أيقونة "X" إلى أقصى اليمين
                        Spacer()
                        
                        Text("Add adress")
                            .bold()
                                              .font(.system(size: 15)) // زيادة حجم الخط هنا
                                              
                                             
                                              .foregroundColor(.black)
                            // أيقونة "X" لحذف المحتويات
                        Button(action: {
                            searchText = "" // حذف النص
                        }) {
                            Image(systemName: "plus.circle") // أيقونة الإضافة الدائرية غير المملوءة
                                   .resizable()
                                   .frame(width: 20, height: 20)
                                   .foregroundColor(Color("my"))
                           }
                    }
                    .padding(.horizontal) // إضافة بعض الـ Padding الأفقي
                }
                VStack(spacing:20){
                    Rectangle()
                        .fill(Color("m"))
                        .frame(height: 15)
                    
                    HStack(spacing: 10){
                        
                        
                        VStack(){
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Beverges")
                                .bold()
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Baked Goods")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Ready TO Eat")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Home Care")
                                .bold()
                        }
                        VStack(){
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Snaks")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Ice Craem")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Meat , poult")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Home & Living")
                                .bold()
                        }
                        VStack(){
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Fruits & Vegeeies")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Food")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Fit & Form")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Pet Food")
                                .bold()
                        }
                        VStack(){
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Milk & Dairy")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Breakfast")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Personal Care")
                                .bold()
                            ZStack{
                                Rectangle()
                                    .fill(Color("c") )
                                    .frame(width: 90, height: 90)
                                .cornerRadius(15)
                                NavigationLink(destination: ProductsView()) {
                                    Image(systemName: "magnifyingglass") // أيقونة البحث
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("my"))
                                }
                            }
                            Text("Baby Care")
                                .bold()
                        }}}
                // Spacer لدفع المحتوى العلوي إلى الأعلى
                Spacer()
               
                ZStack {
                    Rectangle()
                        .fill(Color("c") )
                        .frame(height:100)
                    // .ignoresSafeArea() // تجاهل منطقة الأمان (Notch)
                    
                    // الأيقونات أسفل الشاشة
                    HStack {
                        Spacer()
                        NavigationLink(destination: SearchView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "magnifyingglass") // أيقونة البحث
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("my"))
                        }
                        Spacer()
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "house.fill") // أيقونة المنزل
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("my"))
                        }
                        Spacer()
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "person.fill") // أيقونة الملف الشخصي
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("my"))
                        }
                        Spacer()
                    }}
                // لون خلفية الأيقونات (اختياري)
            }
            .ignoresSafeArea(.container, edges: .bottom) // تجاهل منطقة الأمان للجزء السفلي
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

