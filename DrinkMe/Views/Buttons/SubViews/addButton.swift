//
//  addButton.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct AddButton: View {
    @State private var showingAlert = false
    @State private var waterInput: Double = 0.0
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        return numberFormatter
    }()
    
    var body: some View {
        
        Button(action: {
            showingAlert = true
        }, label: {
            Image(systemName: "plus.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 50)
                .foregroundColor(.black)
                .shadow(radius: 4, y: 4)
            
        })
        .alert("Please enter your amount of water", isPresented: $showingAlert) {
            TextField("330ml", value: $waterInput, formatter: numberFormatter)
            Button("Add", role: .cancel, action: incrementPercent)
        }
        
    }
    func incrementPercent() {
        percent += waterInput
        waterCounting.append(waterInput)
    }
}

