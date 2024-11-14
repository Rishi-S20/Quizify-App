//
//  LoginView.swift
//  Quizify
//
//  Created by Rishi Suryavanshi on 11/12/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        ZStack {
          
            
            
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .offset(y: 35)
                .clipped()
            
            
            VStack(alignment: .center) {
                Button(action: { dismiss() }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                    
                }
                .padding(.top, 80)
               
                
                // Title and Logo
                HStack(spacing: -15) {
                    Text("Quizify")
                        .font(.custom("Kiwi Maru Regular", size: 55))
                        .frame(height: 120)
                        .baselineOffset(10)
                    
                    Image(.quzifyLogo)
                        .resizable()
                        .frame(width: 125, height: 120)
                }
                .padding(.top, 45)
                
                Spacer().frame(height: 20)
                
                Text("Login")
                    .font(.custom("Kiwi Maru Regular", size: 30))
                
                
                
                VStack(spacing: 30) {
                    TextField("Username", text: $username)
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
                    // Handle login
                }) {
                    Text("Login")
                        .font(.custom("Kiwi Maru Regular", size: 18))
                        .frame(width: 233, height: 43)
                        .background(Color(hex: "#C97D60"))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 27)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard)
        .frame(maxHeight: 650)
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


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    LoginView()
}
