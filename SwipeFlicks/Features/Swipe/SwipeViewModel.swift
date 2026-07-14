//
//  SwipeViewModel.swift
//  SwipeFlicks
//
//  Created by Игнат Рогачевич on 12.07.2026.
//

import Combine

@MainActor
final class SwipeViewModel: ObservableObject {
    @Published private(set) var items: [MediaItem] = []
    @Published private(set) var likedItems: [MediaItem] = []
    @Published private(set) var currentIndex = 0
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?
    
    private let mediaService: MediaService
    private let filters: MediaFilters
    
    init(
        mediaService: MediaService = MockMediaService(),
        filters: MediaFilters = .default
    ) {
        self.mediaService = mediaService
        self.filters = filters
    }
    
    var currentItem: MediaItem? {
        guard currentIndex < items.count else {
            return nil
        }
        return items[currentIndex]
    }
    
    var isFinished: Bool {
        !items.isEmpty && currentIndex >= items.count
    }
    
    func load() async {
        isLoading = true
        errorMessage = nil
        
        do {
            items = try await mediaService.fetchMedia(filters: filters)
        } catch {
            errorMessage = "Failed to load movies"
        }
        
        isLoading = false
    }
    
    func likeCurrent() {
        guard let currentItem else {return}
        
        likedItems.append(currentItem)
        moveNext()
    }
    
    func dislikeCurrent() {
        moveNext()
    }
    
    func moveNext() {
        currentIndex += 1
    }
    
}
