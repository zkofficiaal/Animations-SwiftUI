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
    @State private var showText = false
    @Namespace private var animationNamespace

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
        
        
        // Mark: Extra Concept - Delayed Fade In
        Text("Hello Animation")
            .padding()
            .background(.purple)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .opacity(showText ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut.delay(1)) {
                    showText = true
                }
            }
        
        // Mark: Extra Concept - Matched Geometry Effect
        VStack {
            if enabled {
                Circle()
                    .fill(Color.green)
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 100, height: 100)
            } else {
                Rectangle()
                    .fill(Color.orange)
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 100, height: 100)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                enabled.toggle()
            }
        }
        // Mark: Opacity animation
        Button("Fade Me") {
            withAnimation(.easeInOut(duration: 1)) {
                enabled.toggle()
            }
        }
        .frame(width: 150, height: 150)
        .background(.purple)
        .foregroundStyle(.white)
        .opacity(enabled ? 0.3 : 1.0)
        
        // Mark: Scale bounce animation
        Button("Bounce Me") {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.3)) {
                animationAmount = animationAmount == 1.0 ? 1.5 : 1.0
            }
        }
        .frame(width: 150, height: 150)
        .background(.orange)
        .foregroundStyle(.white)
        .scaleEffect(animationAmount)

        // Mark: Color cycling animation
        Button("Color Cycle") {
            withAnimation(.easeInOut(duration: 1)) {
                enabled.toggle()
            }
        }
        .frame(width: 150, height: 150)
        .background(enabled ? .yellow : .pink)
        .foregroundStyle(.black)
        .clipShape(.circle)


        // Mark: Shake animation
        Button("Shake Me") {
            withAnimation(.default) {
                animationAmount = animationAmount == 1.0 ? 1.1 : 1.0
            }
        }
        .frame(width: 150, height: 150)
        .background(.cyan)
        .foregroundStyle(.white)
        .offset(x: enabled ? -10 : 10)
        .animation(.easeInOut(duration: 0.1).repeatCount(5, autoreverses: true), value: enabled)
        .onTapGesture {
            enabled.toggle()
        }
        // Mark: Shake animation
        Button("Shake Me") {
            withAnimation(.default) {
                animationAmount = animationAmount == 1.0 ? 1.1 : 1.0
            }
        }
        .frame(width: 150, height: 150)
        .background(.cyan)
        .foregroundStyle(.white)
        .offset(x: enabled ? -10 : 10)
        .animation(.easeInOut(duration: 0.1).repeatCount(5, autoreverses: true), value: enabled)
        .onTapGesture {
            enabled.toggle()
        }

        // Mark: Sequential animation
        VStack {
            Text("Step 1")
                .opacity(showText ? 1 : 0)
                .animation(.easeInOut.delay(0.5), value: showText)
            
            Text("Step 2")
                .opacity(showText ? 1 : 0)
                .animation(.easeInOut.delay(1.0), value: showText)
            
            Text("Step 3")
                .opacity(showText ? 1 : 0)
                .animation(.easeInOut.delay(1.5), value: showText)
        }
        .onAppear {
            showText = true
        }
        
        // Mark: Pulse animation
        Circle()
            .fill(Color.pink)
            .frame(width: 100, height: 100)
            .scaleEffect(animationAmount)
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    animationAmount = 1.2
                }
            }
        
        // Mark: Blur animation
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundStyle(.yellow)
            .blur(radius: enabled ? 0 : 10)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    enabled.toggle()
                }
            }
        // Mark: Shadow animation
        Circle()
            .fill(Color.blue)
            .frame(width: 120, height: 120)
            .shadow(color: .black.opacity(enabled ? 0.8 : 0.2),
                    radius: enabled ? 20 : 5,
                    x: 0, y: 0)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    enabled.toggle()
                }
            }
        
        // Mark: Gradient animation
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    colors: enabled ? [.red, .yellow] : [.purple, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    enabled.toggle()
                }
            }
            
        // Mark: Shape morph animation
        VStack {
            if enabled {
                Capsule()
                    .fill(Color.green)
                    .frame(width: 200, height: 100)
                    .transition(.scale)
            } else {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
                    .transition(.slide)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)) {
                enabled.toggle()
            }
        }
        
        // Mark: Scale + Opacity combo
        Circle()
            .fill(Color.red)
            .frame(width: 120, height: 120)
            .scaleEffect(enabled ? 1.5 : 1.0)
            .opacity(enabled ? 0.5 : 1.0)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    enabled.toggle()
                }
            }
        
        // Mark: Rotation + Color change
        Rectangle()
            .fill(enabled ? Color.blue : Color.green)
            .frame(width: 150, height: 150)
            .rotationEffect(.degrees(enabled ? 180 : 0))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    enabled.toggle()
                }
            }
        
        // Mark: Continuous spinning
        Image(systemName: "arrow.2.circlepath")
            .resizable()
            .frame(width: 80, height: 80)
            .rotationEffect(.degrees(animationAmount))
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    animationAmount = 360
                }
            }

    }
}

#Preview {
    ContentView()
}
