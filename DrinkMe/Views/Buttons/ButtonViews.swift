//
//  ButtonViews.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 14.03.2024.
//

import SwiftUI


class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}


struct ButtonViews: View {
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
    
    var body: some View {
        HStack {
            GlassButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 10)
            UndoButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 1)
            AddButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 1)
            BottleButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 10)
        }
        .frame(height: 730, alignment: .bottom)
    }
}
