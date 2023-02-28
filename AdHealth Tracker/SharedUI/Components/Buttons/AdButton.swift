//
//  AdButton.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 27/2/23.
//  
//

import SwiftUI

struct AdButton: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    var title: String = "letsgo_label".localized
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ExpButton(action: action, label: {
                Text(title)
                    .font(.body.bold())
                    .foregroundColor(.black)
                    .frame(height: 47)
                    .frame(maxWidth: .infinity)
                    .background(Color.AdidasGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .mediumShadow(.md_3, color: .AdidasGreen)
            }, hapticStyle: .success)
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension AdButton {
    private func onAppear() {}
    
    private func onDisappear() {}
}

//  MARK: - Local Components
extension AdButton {}

//  MARK: - Preview
struct AdButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            AdButton(action: {})
        }
    }
}

