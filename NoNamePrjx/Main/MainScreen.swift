//
//  MainScreen.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome! Username")
            Spacer()
            VStack(alignment: .center,spacing: 24) {
                Button(action: {}) {
                    Text("Create room")
                        .foregroundStyle(.white)
                        .frame(minWidth: 160)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                Button(action: {}) {
                    Text("Join Room")
                        .foregroundStyle(.white)
                        .frame(minWidth: 160)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            Spacer()
        }
    }
}

#Preview {
    MainScreen()
}
