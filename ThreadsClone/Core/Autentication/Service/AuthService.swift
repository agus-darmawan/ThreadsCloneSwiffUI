//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Firebase
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email : String, password : String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Debug error create user \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email : String, password : String, fullname: String, username: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Debug error create user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String,
        profileImageUrl: String? = nil,
        bio: String? = nil
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username, profileImageUrl: profileImageUrl, bio: bio)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
