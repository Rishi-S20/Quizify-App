//
//  SignupView.swift
//  Quizify
//
//  Created by Rishi Suryavanshi on 11/14/24.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var isNameFocused: Bool
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @State private var shouldShowHome = false
    

    private var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && !password.isEmpty
    }
    
    
    var body: some View {
        NavigationView{
            ZStack {
                
                
                
                Image("Flipped Background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .offset(y: 35)
                    .clipped()
                
                
                VStack(alignment: .center) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                        
                    }
                    .padding(.top, 80)
                    
                    
                    // Title and Logo
                    
                    Spacer().frame(height: 40)
                    
                    Image(.quzifyLogo)
                        .resizable()
                        .frame(width: 125, height: 120)
                    
                    
                    Spacer().frame(height: 20)
                    
                    Text("Sign Up")
                        .font(.custom("Kiwi Maru Regular", size: 30))
                    
                    VStack(spacing: 30){
                        
                        
                        TextField("What is your Name?", text: $name)
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 297, height: 52)
                            .padding(.horizontal)
                            .background(Color(hex: "#CECECE").opacity(0.2))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "#C97D60"),
                                            lineWidth: isNameFocused ? 7 : 3)
                                    .animation(.easeInOut(duration: 0.2), value: isNameFocused)
                            )
                            .focused($isNameFocused)
                        
                        
                        TextField("Email", text: $email)
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 297, height: 52)
                            .padding(.horizontal)
                            .background(Color(hex: "#CECECE").opacity(0.2))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "#C97D60"),
                                            lineWidth: isEmailFocused ? 7 : 3)
                                    .animation(.easeInOut(duration: 0.2), value: isEmailFocused)
                            )
                            .focused($isEmailFocused)
                        
                        TextField("Password", text: $password)
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
                
                    Button(action: {
                        if isFormValid {
                            shouldShowHome = true
                        }
                    }) {
                        Text("Sign Up")
                            .font(.custom("Kiwi Maru Regular", size: 18))
                            .frame(width: 233, height: 43)
                            .background(isFormValid ? Color(hex: "#C97D60") : Color.gray)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    .disabled(!isFormValid)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 27)
                    
        
            
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        
            .ignoresSafeArea(.keyboard)
            .fullScreenCover(isPresented: $shouldShowHome) {
                HomeView()
            }
            .frame(maxHeight: 650)
        }
        
    }
}






#Preview {
    SignupView()
}
