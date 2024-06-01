//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriber()
    }
    
    private func setupSubscriber() {
        UserService.shared.$currentUser
            .sink { [weak self] user in
                self?.currentUser = user
            }
            .store(in: &cancellables)
    }
}
