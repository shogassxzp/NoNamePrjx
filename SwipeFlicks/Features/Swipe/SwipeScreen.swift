//
//  SwipeScreen.swift
//  SwipeFlicks
//
//  Created by Игнат Рогачевич on 12.07.2026.
//

import SwiftUI

struct SwipeScreen: View {
    @StateObject private var viewModel = SwipeViewModel()

    var body: some View {
        AppBackground {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                else if let item = viewModel.currentItem {
                    MovieContent(
                        item: item,
                        onLike: viewModel.likeCurrent,
                        onDislike: viewModel.dislikeCurrent
                    )
                } else if viewModel.isFinished {
                    MatchScreen(likedItems: viewModel.likedItems)
                }
                else {
                    Text("No movie found")
                        .foregroundStyle(.white)
                }
            }
            .task {
                await viewModel.load()
            }
        }
    }
}

private struct MovieContent: View {
    let item : MediaItem
    let onLike: () -> Void
    let onDislike: () -> Void
    
    var body: some View {
        VStack(spacing: 18) {
            Text(item.title)
                .lineLimit(1)
                .font(.largeTitle.bold())
                .minimumScaleFactor(0.55)
                .frame(maxWidth: .infinity)

            HStack(alignment: .center, spacing: 20) {
                Text(String(format: "%.1f", item.rating))
                    .font(.title3.bold())
                RatingView(starSize: 24, rating: Int(item.rating.rounded()))
            }
            // TODO: Добавить тени и сообразить красивый цвет для бэка
            Image(.posterPlaceholder)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .scaledToFit()

            HStack(spacing: 16) {
                SwipeActionButton(title: "Dislike", color: .red, action: onDislike)
                SwipeActionButton(title: "Like", color: .green, action: onLike)
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: 320)
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
