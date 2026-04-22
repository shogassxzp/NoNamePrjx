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
}

struct MultiSelectFilterView: View {
    @State private var filterSections: [FilterSection] = [
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
                FilterItem(title: "Детектив")
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
                FilterItem(title: "2019")
            ]
        ),
        FilterSection(
            title: "Рейтинг",
            items: [
                FilterItem(title: "9+"),
                FilterItem(title: "8+"),
                FilterItem(title: "7+"),
                FilterItem(title: "6+")
            ]
        )
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Результат выбранных фильтров
                SelectedFiltersSummary(sections: filterSections)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach($filterSections) { $section in
                            FilterSectionView(section: $section)
                        }
                    }
                    .padding()
                }
                
                // Кнопки действий
                HStack(spacing: 16) {
                    Button("Сбросить все") {
                        resetAllFilters()
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Применить") {
                        applyFilters()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Фильтры")
        }
    }
    
    private func resetAllFilters() {
        for sectionIndex in filterSections.indices {
            for itemIndex in filterSections[sectionIndex].items.indices {
                filterSections[sectionIndex].items[itemIndex].isSelected = false
            }
        }
    }
    
    private func applyFilters() {
        let selectedGenres = filterSections.first { $0.title == "Жанр" }?.items.filter { $0.isSelected }.map { $0.title } ?? []
        let selectedYears = filterSections.first { $0.title == "Год выпуска" }?.items.filter { $0.isSelected }.map { $0.title } ?? []
        
        print("Выбранные жанры: \(selectedGenres)")
        print("Выбранные года: \(selectedYears)")
    }
}

// Компонент для отображения выбранных фильтров
struct SelectedFiltersSummary: View {
    let sections: [FilterSection]
    
    var selectedItems: [(sectionTitle: String, items: [FilterItem])] {
        sections.compactMap { section in
            let selected = section.items.filter { $0.isSelected }
            return selected.isEmpty ? nil : (section.title, selected)
        }
    }
    
    var body: some View {
        if !selectedItems.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Text("Выбранные фильтры:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectedItems, id: \.sectionTitle) { section in
                            ForEach(section.items, id: \.id) { item in
                                HStack(spacing: 4) {
                                    Text("\(section.sectionTitle): \(item.title)")
                                        .font(.caption)
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.caption)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FilterSectionView: View {
    @Binding var section: FilterSection
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.title3)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach($section.items) { $item in
                    FilterChip(
                        title: item.title,
                        isSelected: item.isSelected
                    ) {
                        item.isSelected.toggle()
                    }
                }
            }
        }
    }
}

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSelected ? Color.blue : Color.gray.opacity(0.1))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
    }
}

// Альтернативная версия с горизонтальным скроллом
struct HorizontalFilterSectionView: View {
    @Binding var section: FilterSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.title3)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach($section.items) { $item in
                        FilterChip(
                            title: item.title,
                            isSelected: item.isSelected
                        ) {
                            item.isSelected.toggle()
                        }
                    }
                }
            }
        }
    }
}

// Превью
#Preview {
    MultiSelectFilterView()
}

