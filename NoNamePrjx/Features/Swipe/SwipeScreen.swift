//
//  SwipeScreen.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 12.07.2026.
//

import SwiftUI

struct SwipeScreen: View {
    var body: some View {
        AppBackground {
            VStack(spacing: 24) {
                VStack(spacing: 18) {
                    Text("Blade runner")
                        .lineLimit(1)
                        .font(.largeTitle.bold())
                        .minimumScaleFactor(0.55)
                        .frame(maxWidth: .infinity)
                    
                    HStack(alignment: .center, spacing: 20) {
                        Text("8.96")
                            .font(.title3.bold())
                        RatingView(starSize: 24, rating: 8)
                    }
                    // Todo: Добавить тени и сообразить красивый цвет для бэка
                    Image(.posterPlaceholder)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .scaledToFit()
                }
                
                HStack(spacing: 16) {
                    SwipeActionButton(title: "Dislike", color: .red) {}
                    SwipeActionButton(title: "Like", color: .green) {}
                }
                .padding(.top, 20)
            }
            .frame(maxWidth: 320)
        }
    }
}

private struct SwipeActionButton: View {
    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(color)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(color, lineWidth: 2)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwipeScreen()
}
