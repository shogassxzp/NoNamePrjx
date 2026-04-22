//
//  ListEntity.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 13.04.26.
//

import SwiftUI

struct ListEntity: Identifiable {
    var id = UUID()
    let text: String
    
}

extension ListEntity {
    static let mock = ListEntity(text: "Comedy")
}

