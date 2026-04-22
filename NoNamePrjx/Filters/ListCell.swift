//
//  ListCell.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 13.04.26.
//

import SwiftUI

struct ListCell: View {
    var item: ListEntity
    
    var body: some View {
        HStack {
            Text(item.text)
        }
        .padding(8)
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black.opacity(0.5), lineWidth: 2)
        )
        .frame(maxWidth: .infinity)
    }

}

#Preview {
    ListCell(item: (ListEntity(text: "Comedy")))
}
