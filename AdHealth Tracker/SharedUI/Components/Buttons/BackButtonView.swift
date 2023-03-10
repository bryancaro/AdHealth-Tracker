//
//  BackButtonView.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 26/2/23.
//
//

import SwiftUI

struct BackButtonView: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ExpButton(action: action, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .frame(width: 45, height: 45)
                    .background(Color.White)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .smallShadow(.sm_4)
            }, impactStyle: .soft)
        }
    }
}

//  MARK: - Actions
extension BackButtonView {}

//  MARK: - Local Components
extension BackButtonView {}

//  MARK: - Preview
struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(action: {})
    }
}
