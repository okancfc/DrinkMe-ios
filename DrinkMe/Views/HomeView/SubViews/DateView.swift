//
//  DateView.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 14.03.2024.
//

import SwiftUI

struct DateView: View {
    @State private var currentDate = Date()
  
    var body: some View {
        var components = Calendar.current.dateComponents([.day, .month, .year], from: currentDate)
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date()
        
        return Text("\(date, format: .dateTime.day().month())")
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.currentDate = Date()
                }
                RunLoop.main.add(timer, forMode: .common)
            }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
