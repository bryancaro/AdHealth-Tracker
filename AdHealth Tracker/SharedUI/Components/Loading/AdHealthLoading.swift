//
//  AdHealthLoading.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 28/2/23.
//  
//

import SwiftUI

struct AdHealthLoading: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @State private var id = UUID()
    @Binding var show: Bool
    @State private var scale: CGFloat = 0.8
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            if show {
                Image.Adidas_Logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .scaleEffect(scale)
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true)
                    )
                    .transition(.opacity)
                    .onAppear(perform: onAppear)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.vertical)
        .opacity(show ? 1 : 0)
        .id(id)
        .onChange(of: id, perform: { _ in })
        .animation(.springAnimation.delay(0.4), value: show)
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension AdHealthLoading {
    private func onAppear() {
        scale = 1
    }
    
    private func onDisappear() {}
}

//  MARK: - Local Components
extension AdHealthLoading {}

//  MARK: - Preview
struct AdHealthLoading_Previews: PreviewProvider {
    static var previews: some View {
        AdHealthLoading(show: .constant(true))
    }
}

/*
 struct ScaledImage: View {
     @State private var scale: CGFloat = 0.5
     
     var body: some View {
         Image("myImage")
             .resizable()
             .scaledToFit()
             .scaleEffect(scale)
             .animation(
                 Animation.easeInOut(duration: 1)
                     .repeatForever(autoreverses: true)
             )
             .onAppear() {
                 self.scale = 1
             }
     }
 }

 */
