//
//  UserService.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init(){
        Task {try await fetchCurrentUser()}
    }
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshoot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshoot.data(as: User.self)
        self.currentUser = user
    }
    
    func reset(){
        self.currentUser = nil
    }
}
