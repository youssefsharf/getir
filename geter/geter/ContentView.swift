import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // إزالة المسافات بين العناصر في الـ VStack
                // المحتوى العلوي
                VStack(alignment: .leading, spacing: 20) {
                    // العنوان الرئيسي
                    Text("Profile")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color("my"))
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack {   // قسم تسجيل الدخول
                            HStack {
                                Image(systemName: "person.fill") // أيقونة الإيميل ممتلئة
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("my"))
                                    .padding(.leading, 18)
                                Text("Login")
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                Spacer()
                                NavigationLink(destination: LoginView()) {
                                    Image(systemName: "chevron.right") // أيقونة السهم
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 15)
                                }
                            }
                            Rectangle()
                                .fill(Color("m"))
                                .frame(height: 30)
                        }
                        
                        // قسم العناوين
                        HStack {
                            Image(systemName: "house.fill") // أيقونة المنزل
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("my"))
                                .padding(.leading, 18)
                            
                            Text("My Addresses")
                                .bold()
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                            NavigationLink(destination: LoginView()) {
                                Image(systemName: "chevron.right") // أيقونة السهم
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        Divider() // قسم المفضلة
                        HStack {
                            Image(systemName: "heart.fill") // أيقونة القلب
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("my"))
                                .padding(.leading, 18)
                            
                            Text("Favourite Products")
                                .bold()
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                            NavigationLink(destination: LoginView()) {
                                Image(systemName: "chevron.right") // أيقونة السهم
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        // قسم اللغة
                        Text("Language")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color("m"))
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("English")
                                .bold()
                                .padding(.leading, 18)
                            Spacer()
                            NavigationLink(destination: LoginView()) {
                                Image(systemName: "chevron.right") // أيقونة السهم
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        // قسم الإصدار
                        VStack(spacing: 0) { // إزالة المسافات بين العناصر هنا
                            Text("Version")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color("m"))
                                .foregroundColor(.black)
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                
                                    .fill(Color.white)
                                    .frame(height: 50)
                                
                                Text("25.3.0")
                                
                                    .bold()
                                    .padding(.leading, 18)
                            }
                        }
                    }
                }
                
                // Spacer لدفع المحتوى العلوي إلى الأعلى
                Spacer()
                
                // الجزء السفلي
                ZStack {
                    Rectangle()
                        .fill(Color("c") )
                        .frame(height: 100)
                       // .ignoresSafeArea() // تجاهل منطقة الأمان (Notch)
                    
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
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .bottom) // تجاهل منطقة الأمان للجزء السفلي
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
