//
//  MotivationMessage.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 21.03.2024.
//

import SwiftUI

struct HydrationMotivationalPanel: View {
    
    let messages = [
        "Drinking water not only benefits your body but also your soul. Drink up and rejuvenate!",
        "Drinking water is rediscovering the source of life. Feel the power of a glass of water!",
        "Do yourself a favor today and drink a glass of water. Your body will thank you!",
        "Drinking water gives you energy, vitality, and makes you healthier. Start and drink up!",
        "A glass of water means one step closer to a healthier you. Drink up and treat yourself!",
        "Water is your best friend. Stay loyal to it and drink up!"
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Text(messages[currentIndex])
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .blur(radius: 5) // Cam efekti
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                )
                .padding()
        }
        .onAppear {
            // Start a timer to change the message automatically every 5 seconds
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                // Increment the index to display the next message
                self.currentIndex = (self.currentIndex + 1) % self.messages.count
            }
        }
    }
}

struct MotivationMessage: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            HydrationMotivationalPanel()
        }
    }
}


#Preview {
    MotivationMessage()
}
