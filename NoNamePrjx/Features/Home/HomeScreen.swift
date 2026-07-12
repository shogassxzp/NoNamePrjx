//
//  MainScreen.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            AppBackground {
                VStack(spacing: 28) {
                    Spacer()

                    VStack(spacing: 10) {
                        Text("FlickMatch")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)

                        Text("Choose what to watch together.")
                            .font(.subheadline)
                            .foregroundStyle(AppColors.secondaryText)
                    }

                    Spacer()

                    VStack(spacing: 14) {
                        NavigationLink {
                            FiltersScreen()
                        } label: {
                            PrimaryButtonLabel(title: "Create room", systemImage: "plus")
                        }

                        NavigationLink {
                            JoinRoomScreen()
                        } label: {
                            PrimaryButtonLabel(title: "Join room", systemImage: "person.2")
                        }
                    }
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    HomeScreen()
}
