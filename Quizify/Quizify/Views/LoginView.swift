//
//  LoginView.swift
//  Quizify
//
//  Created by Rishi Suryavanshi on 11/12/24.
//

import SwiftUI

struct LoginView: View {
    //State Variables
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //Background Image
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                
                //Holder for all Containers
                VStack() {
                    
                    
                    VStack(alignment: .leading){
                        
                        
                        NavigationLink(destination: GreetingView()){
                            Image(systemName: "x.circle.fill")
                            
                        }
                        .foregroundColor(.gray)
                        .padding(.top, 113)
                        
                        
                        //Title and Logo
                        HStack(spacing: -15) {
                            Text("Quizify")
                                .font(.custom("Kiwi Maru Regular", size: 55))
                                .frame(height: 120)
                                .baselineOffset(10)
                            
                            Image(.quzifyLogo)
                                .resizable()
                                .frame(width: 125, height: 120)
                        }
                        .padding(.top, 75)
                        
                        Spacer().frame(height: 15)
                        
                        //Login Title and Text Fields
                        Text("Login")
                            .font(.custom("Kiwi Maru Regular", size: 30))
                        
                        VStack(spacing: 30) {
                            TextField(
                                "Username",
                                text: $username
                            )
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 297, height: 52)
                            .padding(.horizontal)
                            .background(Color(hex: "#CECECE").opacity(0.2))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "#C97D60"),
                                            lineWidth: isUsernameFocused ? 7 : 3)
                                    .animation(.easeInOut(duration: 0.2), value: isUsernameFocused)
                            )
                            .focused($isUsernameFocused)
                            
                            TextField(
                                "Password",
                                text: $password
                            )
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 297, height: 52)
                            .padding(.horizontal)
                            .background(Color(hex: "#CECECE").opacity(0.2))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "#C97D60"),
                                            lineWidth: isPasswordFocused ? 7 : 3)
                                    .animation(.easeInOut(duration: 0.2), value: isPasswordFocused)
                            )
                            .focused($isPasswordFocused)
                        }
                    }
                    .padding(.leading, 3)
                    
                    Spacer().frame(height: 27)
                    
                    NavigationLink(destination: GreetingView()) {
                        
                        Text("Login")
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 233, height: 43)
                            .background(Color(hex: "#C97D60"))
                            .cornerRadius(20)
                        
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer().frame(height: 35)
                    
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }
        }
    }

}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    LoginView()
}
