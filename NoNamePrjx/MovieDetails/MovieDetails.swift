//
//  MovieDetails.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI

struct MovieDetails: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    HStack {
                        Text("Blade runner")
                            .font(.title) // Title
                        Spacer()
                        Text("9.1") // Rating
                            .font(.title)
                            .padding()
                    }
                    Image(.posterPlaceholder) // Poster
                        .resizable()
                        .frame(maxWidth: 250, maxHeight: 400)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    Text("В мире недалекого будущего получает распространение новый мощный наркотик — препарат. Агент Фред, полицейский под прикрытием, получает задание выследить мелкого поставщика опасного вещества — наркомана Боба Арктора. Но правда ли это? Или агент Фред — это просто игра воспаленного разума Боба? Кто есть кто теперь, когда границы реальности так зыбки? Роман получил премию Британской ассоциации научной фантастики в 1979 году и был экранизирован Ричардом Линклейтером в 2006 году. ")
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
    MovieDetails()
}
