import SwiftUI

struct ProfileView: View {
    @State private var showingBottomSheet = false
    @State private var showingBottomSheet1 = false
    @State private var showingBottomSheet2 = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var showMessage: String = ""
    @State private var name: String = ""
    @AppStorage("token") var token: String = ""
    @Binding var selectedTab: Int

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Profile")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("purple1"))
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("purple1"))
                            .padding(.leading, 18)
                            .padding(.top, 18)
                        
                        Text("Login")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                            .padding(.top, 18)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showingBottomSheet.toggle()
                            }
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                                .padding(.top, 18)
                        }
                        .sheet(isPresented: $showingBottomSheet) {
                            VStack {
                                Capsule()
                                    .frame(width: 40, height: 5)
                                    .foregroundColor(.gray)
                                    .padding(.top, 30)
                                
                                Text("Let's get started!")
                                    .bold()
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("purple1"))
                                
                                Text("Choose a way to log in or sign up")
                                    .bold()
                                    .padding(.top, 2)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                                
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showingBottomSheet1.toggle()
                                    }
                                }) {
                                    Text("Sign up".uppercased())
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .background(Color("purple1"))
                                        .cornerRadius(10)
                                        .padding(.top, 20)
                                        .padding(.horizontal, 20)
                                }
                                .sheet(isPresented: $showingBottomSheet1) {
                                    VStack {
                                        Capsule()
                                            .frame(width: 40, height: 5)
                                            .foregroundColor(.gray)
                                            .padding(.top, 60)
                                        
                                        Text("Welcome to sign up")
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundColor(Color("purple1"))
                                        Image("1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                            .shadow(radius: 5)
                                        
                                        HStack {
                                            Image(systemName: "envelope")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 10)
                                            TextField("Email", text: $email)
                                        }
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        
                                        HStack {
                                            Image(systemName: "lock")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 10)
                                            
                                            ZStack(alignment: .trailing) {
                                                if showPassword {
                                                    TextField("Password", text: $password)
                                                } else {
                                                    SecureField("Password", text: $password)
                                                }
                                                
                                                Button(action: {
                                                    showPassword.toggle()
                                                }) {
                                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                                        .foregroundColor(.gray)
                                                        .padding(.trailing, 10)
                                                }
                                            }
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        }
                                        .padding()
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            signup(email: email, password: password)
                                        }) {
                                            Text("Sign Up")
                                                .padding()
                                                .foregroundColor(.white)
                                                .background(Color("purple1"))
                                                .cornerRadius(10)
                                                .cornerRadius(8)
                                        }
                                    }
                                    .presentationDetents([.medium])
                                }
                                
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showingBottomSheet2.toggle()
                                    }
                                }) {
                                    Text("Sign in".uppercased())
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .background(Color("purple1"))
                                        .cornerRadius(10)
                                        .padding(.top, 20)
                                        .padding(.horizontal, 20)
                                }
                                .sheet(isPresented: $showingBottomSheet2) {
                                    VStack {
                                        Capsule()
                                            .frame(width: 40, height: 5)
                                            .foregroundColor(.gray)
                                            .padding(.top, 60)
                                        
                                        Text("Welcome to sign in")
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundColor(Color("purple1"))
                                        
                                        Image("1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                            .shadow(radius: 5)
                                        
                                        HStack {
                                            Image(systemName: "envelope")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 10)
                                            TextField("Email", text: $email)
                                        }
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        
                                        HStack {
                                            Image(systemName: "lock")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 10)
                                            
                                            ZStack(alignment: .trailing) {
                                                if showPassword {
                                                    TextField("Password", text: $password)
                                                } else {
                                                    SecureField("Password", text: $password)
                                                }
                                                
                                                Button(action: {
                                                    showPassword.toggle()
                                                }) {
                                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                                        .foregroundColor(.gray)
                                                        .padding(.trailing, 10)
                                                }
                                            }
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        }
                                        .padding()
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            login(email: email, password: password)
                                        }) {
                                            Text("Sign in")
                                                .padding()
                                                .foregroundColor(.white)
                                                .background(Color("purple1"))
                                                .cornerRadius(10)
                                                .cornerRadius(8)
                                        }
                                    }
                                    .presentationDetents([.medium])
                                }
                                
                                Spacer()
                            }
                            .presentationDetents([.height(300)])
                        }
                    }
                    
                    Rectangle()
                        .fill(Color("offwhite"))
                        .frame(height: 20)
                    
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("purple1"))
                            .padding(.leading, 18)
                        Text("My Addresses")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        Spacer()
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("purple1"))
                            .padding(.leading, 18)
                        Text("Favourite Products")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        Spacer()
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    ZStack{
                        Rectangle()
                            .fill(Color("offwhite"))
                            .frame(height: 60)
                        Text("Language")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color("m"))
                            .foregroundColor(.black)
                    }
                    HStack {
                        Text("English")
                            .bold()
                            .padding(.leading, 18)
                        Spacer()
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    ZStack{
                        Rectangle()
                            .fill(Color("offwhite"))
                            .frame(height: 60)
                        Text("Version")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color("m"))
                            .foregroundColor(.black)
                    }
                    
                    Text("25.3.0")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)
                }
                
                Spacer()
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onAppear {
            selectedTab = 2
        }
    }
    
    func signup(email: String, password: String) {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/auth/signup?databaseName=kai") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else { return }
        request.httpBody = httpBody

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    showMessage = "Error: \(error.localizedDescription)"
                    return
                }

                if let data = data, let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                           let token = jsonResponse["token"] as? String {
                            self.token = token
                            showMessage = "Signup successful!"
                            
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showingBottomSheet1 = false
                                showingBottomSheet2 = false
                                showingBottomSheet = false
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                selectedTab = 1
                            }
                        }
                    } else {
                        showMessage = "Failed to register. Status code: \(httpResponse.statusCode)"
                    }
                }
            }
        }.resume()
    }
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://api2.smartinb.ai:8001/api/auth/ecommerce-login?databaseName=kai") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": email.lowercased(), "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    showMessage = "Error: \(error.localizedDescription)"
                    return
                }
                
                if let data = data, let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode == 200 {
                    do {
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                           let token = jsonResponse["token"] as? String {
                            
                            self.token = token
                            showMessage = "Login successful!"
                            
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showingBottomSheet1 = false
                                showingBottomSheet2 = false
                                showingBottomSheet = false
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                selectedTab = 1
                            }
                        }
                    } catch {
                        showMessage = "Failed to parse response."
                    }
                } else {
                    showMessage = "Failed to login. Status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)"
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserData {
    let id: String
    let email: String
    let sex: String
    let wishlist: [String]
    let isCustomer: Bool
    let iban: String
    let cards: [String]
    let createdAt: String
    let updatedAt: String
    let v: Int
    let idNumber: String
    let phoneNumber: String
    let birthDate: String
    let country: String
}

func parseUserData(from data: [String: Any]) -> UserData {
    let id = data["_id"] as? String ?? ""
    let email = data["email"] as? String ?? ""
    let sex = data["sex"] as? String ?? ""
    let wishlist = data["wishlist"] as? [String] ?? []
    let isCustomer = data["isCustomer"] as? Bool ?? false
    let iban = data["iban"] as? String ?? ""
    let cards = data["cards"] as? [String] ?? []
    let createdAt = data["createdAt"] as? String ?? ""
    let updatedAt = data["updatedAt"] as? String ?? ""
    let v = data["__v"] as? Int ?? 0
    let idNumber = data["idNumber"] as? String ?? ""
    let phoneNumber = data["phoneNumber"] as? String ?? ""
    let birthDate = data["birthDate"] as? String ?? ""
    let country = data["country"] as? String ?? ""
    
    return UserData(
        id: id,
        email: email,
        sex: sex,
        wishlist: wishlist,
        isCustomer: isCustomer,
        iban: iban,
        cards: cards,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        idNumber: idNumber,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        country: country
    )
}
