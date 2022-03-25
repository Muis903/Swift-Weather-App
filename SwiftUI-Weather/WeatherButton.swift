//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Mikhail Ivanovskii on 15/03/2022.
//

import SwiftUI

struct WeatherButton: View{
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(20)
    }
}
