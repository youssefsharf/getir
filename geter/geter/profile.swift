//
//  profile.swift
//  geter
//
//  Created by MacBook Air on 3/5/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // العنوان الرئيسي
                Text("Profile")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color("my"))
                    .foregroundColor(.white)
                
                // محتوى الملف الشخصي
                VStack(alignment: .leading, spacing: 20) {
                    // قسم تسجيل الدخول
                    VStack {
                        HStack {
                            Image(systemName: "person.fill")
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
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                     
                    }
                    
                    // قسم العناوين
                    HStack {
                        Image(systemName: "house.fill")
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
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    Divider()
                    
                    // قسم المفضلة
                    HStack {
                        Image(systemName: "heart.fill")
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
                            Image(systemName: "chevron.right")
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
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    // قسم الإصدار
                    VStack(spacing: 0) {
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
                
                Spacer()
                Rectangle()
                    .fill(Color("m"))
                    .frame(height: 100)
                
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

// MARK: - معاينة
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

