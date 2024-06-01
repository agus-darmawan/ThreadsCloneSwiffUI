//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject{
    @Published var userSesion : FirebaseAuth.User?
    
    init() {
        setupSuscriber()
    }
    
    private func setupSuscriber(){
        AuthService.shared.$userSession.sink {[weak self] userSesion in
            self?.userSesion = userSesion
        }
    }
}
