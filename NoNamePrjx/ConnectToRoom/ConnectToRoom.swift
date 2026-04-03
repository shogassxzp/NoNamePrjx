//
//  ConnectToRoom.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 3.04.26.
//

import SwiftUI
// TODO: Generate dark background like in TG with movie atibutes
struct ConnectToRoom: View {
    @State var code: String
    @FocusState var isTextFieldFocused: Bool
    var body: some View {
        VStack(alignment: .center,
               spacing: 16) {
            Spacer()
            Text("Enter entrance code")
            HStack(alignment: .center) {
                Spacer()
                TextField("Code", text: $code)
                    .foregroundStyle(.red) // change color
                    .submitLabel(.done)
                    .onSubmit { hideKeyboard() }
                    .padding()
                    .frame(maxWidth: 230)

                Button(action: clearText) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
                .padding(.trailing)
            }
            .background(.gray.opacity(0.4))
            .frame(maxWidth: 230)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.green, lineWidth: 2)
            )
            Spacer()

            Button(action: {}) {
                Text("Lets choose")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
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
    ConnectToRoom(code: "")
}
