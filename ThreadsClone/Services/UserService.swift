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
    
    static func fetchUsers() async throws -> [User]{
        guard let currentUid = Auth.auth().currentUser?.uid else {return []}
        let snapshoot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshoot.documents.compactMap({try? $0.data(as: User.self) })
        return users.filter({$0.id != currentUid})
    }
    
    static func fetchUser(withUid uid : String) async throws -> User{
        let snapshoot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshoot.data(as: User.self)
        
    }
    
    func reset(){
        self.currentUser = nil
    }
    
    func updateUserProfileImage(withImageUrl imageUrl : String) async throws{
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl" : imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
