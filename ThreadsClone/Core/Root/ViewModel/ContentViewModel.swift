//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Combine
import Firebase

@MainActor
class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriber()
    }
    
    private func setupSubscriber() {
        AuthService.shared.$userSession
            .sink { [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables)
    }
}
