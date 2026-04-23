import SwiftUI

    // TODO: Find/Create background
    // Change release date with datePicker

struct MultiSelectFilterView: View {
    @State private var filterSections: [FilterSection] = FilterSection.mockFilterSection // change mock on API call

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
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    Button("Применить") {
                        applyFilters()
                    }
                    .foregroundStyle(.black) // Find good color match
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding()
                .padding(.horizontal)
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
        GridItem(.flexible()),
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

// Preview

#Preview {
    MultiSelectFilterView()
}
