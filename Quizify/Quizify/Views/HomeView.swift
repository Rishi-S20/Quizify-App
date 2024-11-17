//
//  HomeView.swift
//  Quizify
//
//  Created by Rishi Suryavanshi on 11/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack(){
                
                HStack() {
                    
                    
                    Image(systemName: "text.justify")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding(.trailing, 5)
                    Spacer().frame(width: 50)
                    
                    HStack(spacing: -10){
                        Text("Quizify")
                            .font(.custom("Kiwi Maru Light", size: 30))
                            .foregroundColor(Color(.black))
                            .frame(height: 120)
                            .baselineOffset(10)
                        
                        Image(.quzifyLogo)
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    
                    
                    Spacer().frame(width: 50)
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                  
                        
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack(){
                    Text("Recents")
                        .font(.custom("Kiwi Maru Light", size: 25))
                        .foregroundColor(Color(.gray))
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 167, height: 118)
                                    .background(Color(hex: "#C97D60"))
                                    .cornerRadius(15)
                                    
                            }
                        }
                    }
                    
                    
                    
                }
                .padding(.leading, 30)
               
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .preferredColorScheme(.light)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
