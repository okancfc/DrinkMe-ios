//
//  AmountOfWatterButton.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 20.03.2024.
//

import SwiftUI

struct AmountOfWatterButton: View {
    @State private var showingAlert2 = false
    @Binding var waterLimitInput: Double
    @State private var waterLimit: String = ""
    @State private var isPresented = false

    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        return numberFormatter
    }()
    
    var body: some View {
        Button(action: {
            showingAlert2 = true
            HapticManager.instance.impact(style: .soft)
            isPresented.toggle()
        }, label: {
            Image(systemName: "gearshape")
                .foregroundColor(.black)
                .font(.largeTitle)
                .bold()
        })
        .sheet(isPresented: $isPresented) {
                FullScreenModalView()

        }
        /*
        .alert("Please enter your DAILY LIMIT", isPresented: $showingAlert2) {
            TextField("3000ml...", text: $waterLimit)
            Button("OK") {
                if let value = Double(waterLimit) {
                    waterLimitInput = value
                } else {
                    print("Please enter valid number!")
                }
            }
            */
    }
}

#Preview {
    AmountOfWatterButton(waterLimitInput: .constant(2))
}
