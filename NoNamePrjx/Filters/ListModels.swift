//
//  ListEntity.swift
//  NoNamePrjx
//
//  Created by Игнат Рогачевич on 13.04.26.
//

import SwiftUI

// Модель для элемента фильтра
struct FilterItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var isSelected: Bool = false
}

// Модель для секции фильтра
struct FilterSection: Identifiable {
    let id = UUID()
    let title: String
    var items: [FilterItem]
    
    static let mockFilterSection: [FilterSection] = [
        FilterSection(
            title: "Жанр",
            items: [
                FilterItem(title: "Комедия"),
                FilterItem(title: "Драма"),
                FilterItem(title: "Боевик"),
                FilterItem(title: "Триллер"),
                FilterItem(title: "Фантастика"),
                FilterItem(title: "Ужасы"),
                FilterItem(title: "Мелодрама"),
                FilterItem(title: "Детектив"),
            ]
        ),
        FilterSection(
            title: "Год выпуска",
            items: [
                FilterItem(title: "2024"),
                FilterItem(title: "2023"),
                FilterItem(title: "2022"),
                FilterItem(title: "2021"),
                FilterItem(title: "2020"),
                FilterItem(title: "2019"),
            ]
        ),
        FilterSection(
            title: "Рейтинг",
            items: [
                FilterItem(title: "9+"),
                FilterItem(title: "8+"),
                FilterItem(title: "7+"),
                FilterItem(title: "6+"),
            ]
        ),
    ]
}
