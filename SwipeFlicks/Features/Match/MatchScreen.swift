//
//  MatchScreen
//  SwipeFlicks
//
//  Created by Игнат Рогачевич on 14.07.2026.
//

import SwiftUI

struct MatchScreen: View {
    let likedItems: [MediaItem]

    var body: some View {
        AppBackground {
            VStack {
                Text("Your picks")
                    .font(.title.bold())
                    .foregroundStyle(AppColors.accent)
                Text("Liked count: \(likedItems.count)")
                    .font(.title2.bold())
                    .foregroundStyle(AppColors.secondaryText)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(likedItems) { item in
                            NavigationLink {
                                MovieDetailsScreen(item: item)
                            } label: {
                                LikedMediaRow(item: item)
                            }
                            .buttonStyle(.plain)
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

private struct LikedMediaRow: View {
    let item: MediaItem

    var body: some View {
        HStack(spacing: 14) {
            Image(.posterPlaceholder)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 72, height: 108)

            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text("\(item.displayYear) •  \(String(format: "%.1f", item.rating))")
                    .font(.subheadline)
                    .foregroundStyle(AppColors.secondaryText)
                Text(item.genres.map(\.name).joined(separator: ", "))
                    .font(.caption)
                    .foregroundStyle(AppColors.secondaryText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .font(.title3.weight(.semibold))
                .foregroundStyle(AppColors.secondaryText)
                .padding(.trailing)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(AppColors.surface)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        MatchScreen(likedItems: MediaItem.matchPreviewItems)
    }
}

#Preview {
    LikedMediaRow(item: .matchPreviewItems[0])
        .padding()
        .background(AppColors.background)
}

private extension MediaItem {
    static let matchPreviewItems: [MediaItem] = [
        MediaItem(
            id: 78,
            title: "Blade Runner",
            overview: "A retired detective hunts synthetic humans through a rain-soaked future Los Angeles.",
            posterPath: nil,
            rating: 8.1,
            releaseYear: 1982,
            mediaType: .movie,
            genres: [
                Genre(id: 878, name: "Science Fiction"),
                Genre(id: 53, name: "Thriller"),
            ]
        ),
        MediaItem(
            id: 155,
            title: "The Dark Knight",
            overview: "Batman faces a criminal mastermind whose chaos tests Gotham and everyone trying to save it.",
            posterPath: nil,
            rating: 9.0,
            releaseYear: 2008,
            mediaType: .movie,
            genres: [
                Genre(id: 28, name: "Action"),
                Genre(id: 18, name: "Drama"),
            ]
        ),
        MediaItem(
            id: 550,
            title: "Fight Club",
            overview: "An office worker and a soap maker build an underground movement with dangerous consequences.",
            posterPath: nil,
            rating: 8.4,
            releaseYear: 1999,
            mediaType: .movie,
            genres: [
                Genre(id: 18, name: "Drama"),
            ]
        ),
    ]
}
