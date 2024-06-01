//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    @MainActor
    func login(withEmail email : String, password : String) async throws{
        
    }
    
    func createUser(withEmail email : String, password : String, fullname: String, username: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Debug create user : \(result.user.uid)")
        } catch {
            print("Debug error create user \(error.localizedDescription)")
        }
    }
}