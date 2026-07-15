//
//  ContentView.swift
//  Animations
//
//  Created by Z.K   on 11/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1.0
    @State private var enabled = false

    
    var body: some View{
        //Mark: Implicit view animation
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
        
        // Mark: Implicit Binding animation
        //        VStack {
        //            Stepper("Scale amount", value: $animationAmount.animation(
        //                    .easeInOut(duration: 1)
        //                    .repeatCount(5, autoreverses: true)
        //            ), in: 1...10)
        //
        //            Spacer()
        //
        //            Button("Tap Me") {
        //                    animationAmount += 1
        //            }
        //            .padding(40)
        //            .background(.red)
        //            .foregroundStyle(.white)
        //            .clipShape(.circle)
        //            .scaleEffect(animationAmount)
        //        }
        
//        //Mark: Explicit animation
//        Button("tap me"){
//            withAnimation(.spring(duration: 1, bounce: 0.5)){
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        Button ("tap me "){
            //tap me
        }
        .background(.blue)
        .frame(width: 200, height: 200)
        .foregroundStyle(Color.white)
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled )
        
        

    }
}

#Preview {
    ContentView()
}
