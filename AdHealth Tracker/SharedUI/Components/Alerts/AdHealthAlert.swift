//
//  AdHealthAlert.swift
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

struct AdHealthAlert: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @Binding var show: Bool
    @Binding var errorString: String
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(errorString)
                        .font(.footnote.bold())
                        .foregroundColor(.red)
                }
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.red, lineWidth: 2)
                )
                .padding(.horizontal)
                .offset(y: show ? 0 : -200)
                .animation(.easeInOut(duration: 0.5), value: show)
                .onAppear(perform: onAppear)
                .onDisappear(perform: onDisappear)
                
                Spacer()
            }
        }
        .onChange(of: show, perform: showAlert)
    }
}

//  MARK: - Actions
extension AdHealthAlert {
    private func onAppear() {}
    
    private func onDisappear() {}
    
    private func dismissAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            show = false
        })
    }
    
    private func showAlert(_ show: Bool) {
        if show {
            haptic(type: .error)
            dismissAlert()
        }
    }
}

//  MARK: - Local Components
extension AdHealthAlert {}

//  MARK: - Preview
struct AdHealthAlert_Previews: PreviewProvider {
    static var previews: some View {
        AdHealthAlert(show: .constant(false), errorString: .constant("This app is not authorized to access health data."))
    }
}

