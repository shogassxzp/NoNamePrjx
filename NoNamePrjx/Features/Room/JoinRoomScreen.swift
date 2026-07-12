//
//  ConnectToRoom.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI

struct JoinRoomScreen: View {
    @State private var code: String = ""
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        AppBackground {
            VStack(alignment: .center, spacing: 16) {
                Spacer()

                Text("Enter room code")
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                HStack(alignment: .center) {
                    TextField("Code", text: $code)
                        .textInputAutocapitalization(.characters)
                        .foregroundStyle(.white)
                        .submitLabel(.done)
                        .focused($isTextFieldFocused)
                        .onSubmit { hideKeyboard() }
                        .padding()

                    Button(action: clearText) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(AppColors.secondaryText)
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing)
                }
                .background(AppColors.surface)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(AppColors.accent, lineWidth: 1)
                )
                .frame(maxWidth: 260)

                Spacer()

                Button(action: {}) {
                    PrimaryButtonLabel(title: "Let's choose", systemImage: "play.fill")
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Join room")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func clearText() {
        code = ""
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

#Preview {
    NavigationStack {
        JoinRoomScreen()
    }
}
