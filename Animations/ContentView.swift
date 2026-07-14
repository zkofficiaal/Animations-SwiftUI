//
//  ContentView.swift
//  Animations
//
//  Created by Z.K   on 11/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View{
        VStack{
            //            Button("Tap Me"){
            //                //animationAmount += 1.0
            //            }
            //            .padding(50)
            //            .background(.red)
            //            .foregroundStyle(Color.white)
            //            .clipShape(.circle)
            //            //.scaleEffect(animationAmount)
            //            //.animation(.linear, value: animationAmount)
            //            .overlay(
            //                Circle()
            //                    .stroke(Color.black)
            //                    .scaleEffect(animationAmount)
            //                    .opacity(2-animationAmount)
            //                    .animation(
            //                        .easeInOut(duration: 2)
            //                        .repeatForever(autoreverses: false),value: animationAmount
            //                    )
            //            )
            //            .onAppear(){
            //                animationAmount = 2
            //            }
            //
            // control binding
            
        VStack {
                Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
                
                Spacer()
                
            Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
            }
        }
    }
}

#Preview {
    ContentView()
}
