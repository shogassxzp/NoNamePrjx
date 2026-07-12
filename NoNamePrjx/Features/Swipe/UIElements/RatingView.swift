//
//  RatingView.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 12.07.2026.
//

import SwiftUI

struct RatingView: View {
    let starSize: CGFloat
    
    let rating: Int
    let maxRating: Int = 5
    let colorOpacity: Double = 0.3
    
    init(starSize: CGFloat = 24, rating: Int) {
        self.starSize = starSize
        self.rating = rating
    }
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(.star)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: starSize,height: starSize)
                    .foregroundStyle(index <= rating / 2 ? .yellow : .gray.opacity(colorOpacity))
            }
        }
    }
}

#Preview {
    RatingView(starSize: 24, rating: 8)
}
