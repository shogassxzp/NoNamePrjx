//
//  MovieDetails.swift
//  SwipeFlicks
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI

struct MovieDetailsScreen: View {
    let item: MediaItem
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    HStack {
                        Text(item.title)
                            .font(.title) // Title
                        Spacer()
                        Text(item.displayRating) // Rating
                            .font(.title)
                            .padding()
                    }
                    Image(.posterPlaceholder) // Poster
                        .resizable()
                        .frame(maxWidth: 250, maxHeight: 400)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    Text(item.overview)
                    Image(.ref2)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 400,maxHeight: 200)
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 20)
                }
                .frame(width: .infinity)
                .padding()
            }
            
            
            VStack {
                Spacer()
                HStack(alignment: .bottom, spacing: 24) {
                    Button(action: {}) {
                        Text("Dislike")
                            .foregroundStyle(.red)
                            .frame(minWidth: 120)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red, lineWidth: 2)
                            )
                    }
                    
                    Button(action: {}) {
                        Text("Like")
                            .foregroundStyle(.green)
                            .frame(minWidth: 120)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.green, lineWidth: 2)
                            )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 80)
                
//                if #available(iOS, 26.0) {
//                    .glassEffect()
//                } else {
//                    .background(.white)
//                }
            }
            .padding(.bottom,6)
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    MovieDetailsScreen(item: MediaItem(
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
    ))
}
