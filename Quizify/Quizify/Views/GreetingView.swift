//
//  GreetingView.swift
//  Quizify
//
//  Created by Rishi Suryavanshi on 11/12/24.
//

import SwiftUI


//Fade Settings
struct TextFader: View {
    let texts: [String]
    @State private var currentIndex = 0
    @State private var opacity = 1.0
    
    // Customizable timing values
    let fadeOutDuration: Double = 0.5
    let fadeInDuration: Double = 0.5
    let displayDuration: Double = 2.0
    
    var body: some View {
        Text(texts[currentIndex])
            .opacity(opacity)
            .onAppear {
                startFadeSequence()
            }
    }
    
    private func startFadeSequence() {
        // Create a continuous animation sequence
        Timer.scheduledTimer(withTimeInterval: displayDuration + fadeOutDuration + fadeInDuration, repeats: true) { _ in
            fadeToNextText()
        }
    }
    
    private func fadeToNextText() {
        // Fade out current text
        withAnimation(.easeOut(duration: fadeOutDuration)) {
            opacity = 0
        }
        
        // After fade out, change text and fade in
        DispatchQueue.main.asyncAfter(deadline: .now() + fadeOutDuration) {
            currentIndex = (currentIndex + 1) % texts.count
            
            withAnimation(.easeIn(duration: fadeInDuration)) {
                opacity = 1
            }
        }
    }
}





struct GreetingView: View {
    
    
    let textArray = [
        "Wisdom is not a product of schooling but of the lifelong attempt to acquire it./n — Albert Einstein",
        "Wisdom comes not from age, but from education and learning.― Anton Chekhov",
        "Learning never exhausts the mind. ― Leonardo da Vinci",
        "For the best return on your money, pour your purse into your head.― Benjamin Franklin"
    ]
    
    var body: some View {
        NavigationView(){
            ZStack{
                
                //Background Color
                Color(hex: "#C97D60").ignoresSafeArea()
                
                //Holds all elements
                VStack{
                    
                    HStack(spacing: -15) {
                        Text("Quizify")
                            .font(.custom("Kiwi Maru Medium", size: 55))
                            .foregroundColor(Color(hex: "#DFDBDB"))
                            .frame(height: 120)
                            .baselineOffset(10)
                        
                        Image(.quizifyLogoWhite)
                            .resizable()
                            .frame(width: 125, height: 120)
                    }
                    .padding(.top, 50)
                    
                    Spacer().frame(height: 125)
                    
                    
                    TextFader(texts: textArray)
                        .font(.custom("Kiwi Maru Light", size: 20))
                        .foregroundColor(Color(hex: "#DFDBDB"))
                        .padding(.leading, 20)
                        .padding(.leading, 20)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                
                
                
            }
            
        }
        
        
        
    }
}

#Preview {
    GreetingView()
}
